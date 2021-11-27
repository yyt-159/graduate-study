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
    if current_user.admin
      @task = Task.find_by(id:params[:id])
    end
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
    if current_user.admin
      @task = Task.find_by(id:params[:id])
    end
  end

  def update
    if current_user.admin
      @task = Task.find_by(id:params[:id])
    end
    @task.update(task_params)
    redirect_to @task
  end

  def destroy
    if current_user.admin
      @task = Task.find_by(id:params[:id])
    end
    @task.destroy
    if current_user.admin
      redirect_to "/admin/index"
    else
      redirect_to tasks_url
    end
  end

  def done
    if current_user.admin
      @task = Task.find_by(id:params[:id])
    end
    @task.completed = true
    @task.save!
    if current_user.admin
      redirect_to "/admin/index"
    else
      redirect_to tasks_url
    end
    
  end

  def done_back
    if current_user.admin
      @task = Task.find_by(id:params[:id])
    end
    @task.completed = false
    @task.save!
    if current_user.admin
      redirect_to "/admin/index"
    else
      redirect_to tasks_url
    end
    
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
