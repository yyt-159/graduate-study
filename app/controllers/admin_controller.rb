class AdminController < ApplicationController
# adminかどうか確認
before_action :authenticate_admin!

  def index
    @users = User.all
    @teams = Team.all
  end

  def edit
    @user = User.find_by(id:params[:id])
    select_team = Team.all.length
    @select_team_num = []
    for num in 1..select_team do
      @select_team_num.push([num,num])
    end
  end

  def update
    @user = User.find_by(id:params[:id])
    @user.update!(user_params)
    redirect_to "/admin/index"
  end

  def team_edit
    @team = Team.find_by(id:params[:id])
  end

  def team_update
    @team = Team.find_by(id:params[:id])
    @team.update!(team_params)
    redirect_to "/admin/index"
  end

  def reset_team_point
    all_team = Team.all
    all_team.each do |t|
      t.team_total_point = 0
      t.save
    end
    redirect_to "/admin/index"
  end

  private
  def authenticate_admin!
    redirect_to(root_url) unless current_user.admin
  end

  def user_params
    params.require(:user).permit(:username, :email, :team_id)
  end

  def team_params
    params.require(:team).permit(:team_total_point)
  end

end
