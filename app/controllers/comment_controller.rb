class CommentController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
    @task = Task.find_by(id: params[:task_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.order = Comment.where(task_id: params[:task_id]).maximum(:order).to_i + 1 
    if @comment.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
  end

  def edit
    @tasks = Task.where(user: current_user)
    @comments = Comment.where(task_id: params[:task_id]).rank(:row_order)
  end

  def update
     # タスクに変更があった場合、orderも更新
     if params[:task_id] != comment_params[:task_id]
      @comment.order = Comment.where(task_id: comment_params[:task_id]).maximum(:order).to_i + 1    # Taskにコメントが存在しない場合、nilが返却されるので問題なく動くようにto_iする
    # 並び順に変更があった場合
    elsif @comment.order != comment_params[:order]
      order_after = comment_params[:order].to_i
      # 変更前のorder > 変更後のorder
      if @comment.order > order_after
        (order_after..@comment.order-1).each {|n| 
          @comment_order = Comment.find_by(task_id: params[:task_id], order: n)
          @comment_order.update_attributes(order: n+1)
        }
      # 変更前のorder < 変更後のorder
      elsif @comment.order < order_after
        (@comment.order+1..order_after).each {|n| 
          @comment_order = Comment.find_by(task_id: params[:task_id], order: n)
          @comment_order.update_attributes(order: n-1)
        }
      end
      @comment.order = comment_params[:order]
    end
    if @comment.update_attributes(comment_params)
      redirect_to :root
    else
      render action: :edit
    end
  end


  def destroy
    comments = Comment.where(task_id: params[:task_id], order: @comment.order+1..Float::INFINITY)
    comments.each { |comment|
      comment.update_attributes(order: comment.order-1)
    }
    @comment.destroy
    redirect_to :root
  end


  def sort
    comment = Comment.find(params[:comment_id])
    # after_task_idをtask_idとして渡して処理したい
    comment.update(comment_params)
    render body: nil
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :memo, :task_id, :order, :row_order_position)
    end

    def set_comment
      @comment = Comment.find_by(id: params[:id])
    end
end
