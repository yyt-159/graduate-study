class TasksController < ApplicationController
  # 認証済みであることを確認
  before_action :authenticate_user!

  before_action :set_sub_task_new, only: [:index, :show, :new]
  before_action :set_task, only: [:show, :edit, :update, :destroy, :done, :done_back]
  before_action :set_task_new, only: [:new]

  def index
    @tasks = current_user.tasks
    @user = current_user
  end

  def show
    @params = params
    @sub_tasks = Task.find_by(id: params[:id]).sub_tasks.all
  end

  def new
    
  end

  def create
    @task = current_user.tasks.new task_params
    @task.save!
    redirect_to @task
  end

  def edit

  end

  def update
    @task.update(task_params)
    redirect_to @task
  end

  def destroy
    @task.destroy
    redirect_to tasks_url
  end

  def done
    @task.completed = true
    @task.save!
    redirect_to tasks_url
  end

  def done_back
    @task.completed = false
    @task.save!
    redirect_to tasks_url
  end

  private
  def target_task task_id
    current_user.tasks.where(id: task_id).take
  end

  def task_params
    params.require(:task).permit(:title, :description, :public_task,:target_at, :completed_at, :completed)
  end

  def set_sub_task_new
    @sub_task = SubTask.new
  end

  def set_task
    @task = target_task params[:id]
  end

  def set_task_new
    @task = Task.new
  end
end
