class SubTasksController < ApplicationController
  # 認証済みであることを確認
  before_action :authenticate_user!

  before_action :set_sub_task, only: [:done, :done_back, :edit, :update, :destroy]
 

  def done
    @sub_task.completed = true
    if @sub_task.done_times == 0
      point_create(current_user,3)
      @sub_task.done_times += 1
    end
    @sub_task.save
    redirect_to task_path(params[:task_id])
  end

  def done_back
    @sub_task.completed = false
    @sub_task.save!
    redirect_to task_path(params[:task_id])
  end

  def create
    if @sub_task = SubTask.create(sub_task_params)
      # サブタスク作成時にポイントを生成
      point_create(current_user,1)
      redirect_to task_path(params[:task_id]) 
    else
      render :new
    end
  end

  def edit

  end

  def update
    @sub_task.update(sub_task_params)
    redirect_to task_url(params[:task_id])
  end

  def destroy
    @sub_task.destroy
    redirect_to task_url(params[:task_id])
  end

  private

  def sub_task_params
    params.require(:sub_task).permit(:title, :description,:public_sub_task, :task_id, :target_at, :completed_at, :completed)
  end

  def set_sub_task
    @sub_task = SubTask.find_by(id:params[:id])
  end
end
