class TaskController < ApplicationController

  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @group = Group.find_by(id: params[:group_id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to :root
    else
      render :new
    end
  end

  def edit
    @group = Group.find_by(id: params[:group_id])
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to :root
  end



  private
    def task_params
      params.require(:task).permit(:title).merge(user_id: current_user.id)
    end

    def set_task
      @task = Task.find_by(id: params[:id])
    end
end
