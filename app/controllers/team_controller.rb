class TeamController < ApplicationController
  # 認証済みであることを確認
  before_action :authenticate_user!

  def index
    # 自分のタスクを持ってきて、代入
    @tasks = Task.where(id:params[:id]).order(created_at: "DESC")
    task_all = Task.all.order(created_at: "DESC")
    task_all.each do |task|
      user = User.find_by(id:task.user_id)
      if task.public_task && user.team_id == current_user.team_id
        @tasks += [task]
      end
    end
  end

  def member
    # カレンとユーザーのチームメイトを持ってきて、代入
    @my_team_members = User.where(team_id:current_user.team_id)
    @show_team_id = params[:id]
  end

  def team_rank
    @team_order = Team.order(team_total_point: :desc)
  end

  def individual_rank
  end

end
