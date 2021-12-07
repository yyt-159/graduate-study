module TeamHelper
  def team_rank_culc(current_user)
    @team_order = Team.order(team_total_point: :desc)
    @team_rank = 0
    @team_order.each_with_index do |team,index|
      if team.id == current_user.team_id
        @team_rank = index + 1
      end
    end
    return @team_rank
  end

    # current_userのteamのteam_total_pointを返します
    def current_user_team_point_culc(current_user)
      @current_user_team = Team.find_by(id:current_user.team_id)
      return @current_user_team.team_total_point
    end

end
