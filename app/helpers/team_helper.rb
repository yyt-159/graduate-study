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

end
