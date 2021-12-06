class TasksController < ApplicationController
  # 認証済みであることを確認
  before_action :authenticate_user!

  before_action :set_sub_task_new, only: [:index, :show, :new]
  before_action :set_task, only: [:show, :edit, :update, :destroy, :done, :done_back]
  before_action :set_task_new, only: [:new]

  def index
    @tasks = Task.where(user_id:current_user.id).order(target_at: "ASC")
    @user = current_user
    today_point_culc(current_user)
  end

  def show
    if current_user
      if current_user.admin
        @task = Task.find_by(id:params[:id])
      end
      @sub_tasks = Task.find_by(id: params[:id]).sub_tasks.all
      @back_sign = true
      @back_url = tasks_url
    end
  end

  def new
    
  end

  def create
    @task = current_user.tasks.new task_params
    if @task.save
      redirect_to @task
    else
      render :new
    end
    
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
    if @task.done_times == 0
      point_create(current_user,task_point_culc(@task))
      @task.done_times += 1
      current_user.total_done_task += 1 if current_user.total_done_task
      current_user.save
    end
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
