class CommentController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
    @task = Task.find_by(id: params[:task_id])
  end

  def create
    @comment = Comment.new(comment_params)
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
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to :root
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :memo, :task_id)
    end

    def set_comment
      @comment = Comment.find_by(id: params[:id])
    end
end
