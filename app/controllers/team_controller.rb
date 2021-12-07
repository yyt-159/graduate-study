class TeamController < ApplicationController
  # 認証済みであることを確認
  before_action :authenticate_user!

  def index
    #期限の順に変えた
    task_all = Task.all.order(target_at: "DESC")
    @tasks = []
    task_all.each do |task|
      user = User.find_by(id:task.user_id)
      # 「completedしているタスクは含めない」かつ「パブリックであるものを含める」かつ「チームが一緒の人を含める」
      if !task.completed && task.public_task && user.team_id == current_user.team_id
        @tasks += [task]
      end
    end
  end

  def member
    # paramsのidを代入（current_userとは違うteamのページを表示させるため）
    @show_team_id = params[:id]
    if @show_team_id == current_user.team_id
      @my_team_members = User.where(team_id:current_user.team_id)
    else
      @my_team_members = User.where(team_id:@show_team_id)
    end
  end

  def team_rank
    @team_order = Team.order(team_total_point: :desc)
  end

  def individual_rank
  end

end
