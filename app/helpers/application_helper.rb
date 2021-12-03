module ApplicationHelper

#コピー用↓
# 関数名:
# 引数:
# 説明:
# 使用場所:

# 関数名:is_deadline_over?(date)
# 引数:@task.target_at(タスクの期日)
# 説明:指定タスクが期日を超過していればred、過ぎていなければgreenを返します。期日の文字の色を変更する目的で使用します
# 使用場所:app/views/tasks/show.html.erb
  def is_deadline_over?(date)
    today = Date.today
    if date < today
      "red"
    else
       "green"
    end
  end


# 関数名:remaining_day?(date)
# 引数:@task.target_at(タスクの期日)
# 説明:指定タスクが期日を超過していれば空を、過ぎていなければ残りの日にちを返します。
# 使用場所:app/views/tasks/show.html.erb
  def remaining_day?(date)
    today = Date.today
    if date < today
      return ""
    else
      remaining_day = date - today
      return "あと#{remaining_day.to_i}日"
    end
  end

# 関数名: who_is_this?(user_id)
# 引数: タスクが持つuser_id
# 説明: タスクからusernameを引っ張る
# 使用場所: app/views/team/index.html.erb
  def who_is_this?(user_id)
    user = User.find_by(id:user_id)
    if user
      user.username
    end
  end

# 引数:今のユーザーのモデル
# 渡されたユーザーの今日のポイントを@today_pointに入れ返します。
  def today_point_culc(current_user)
    points = Point.where(user_id:current_user.id)
    @today_point = 0
    today = Date.today
    if points
      points.each do |p|
        if p.created_at.to_date == today && p.point
          @today_point += p.point
        end
      end
    end
    return @today_point 
  end


### 期間中の関数 ###

def is_term_point?
  @last_point = Point.last
  @last_point_date = Point.last.created_at.to_date
  @set_term_begin = SetTerm.first.term
  @set_term_end = SetTerm.first.term.days_since(7)
  if @last_point_date >= @set_term_begin && @last_point_date <= @set_term_end
     true
  else
     false
  end
end

# 期間中ならuserのterm_pointに足す
  def user_term_point_culc(current_user)
    if is_term_point?
      current_user.term_point += @last_point.point
      current_user.save
    end
  end
# 期間中ならuserのteamのteam_total_pointにポイントを足す
  def team_term_point_culc(current_user)
    if is_term_point?
      team = Team.find_by(id:current_user.team_id)
      team.team_total_point += @last_point.point
      team.save
    end
  end

### taskのポイントの処理 ###

# 引数:taskのモデル
# 説明:引数のタスクが何日前に完了したか判断し、適切なポイントを返します
# 使用場所:
def task_point_culc(task)
   unless task.done_times == 0
    return "ポイント獲得済み"
   end
  today = Date.today
  if task.target_at
    target_at_day = task.target_at 
    remaining_day = target_at_day - today
    remaining_day = remaining_day.to_i
    if remaining_day > 4 then
        3
      elsif remaining_day > 2 then
        2
      elsif remaining_day > -1 then
        1
      else
        0
    end
  end
   
end

def user_gain_point_culc(current_user,num)
  if current_user.user_gain_point
    current_user.user_gain_point += num
    current_user.save
  end
end

  # 関数名:point_create(current_user)
  # 引数:(str:現在のユーザーのモデル,int:与えたいポイント)
  # 説明:ポイントを生成
  # 使用場所:
  def point_create(current_user,num)
    Point.create(point:num,user_id:current_user.id) if num && current_user
    ## point_create後すぐuserとteamの期間中のポイント加算、userのuser_gain_pointに加算する処理をする
    user_gain_point_culc(current_user,num)
    user_term_point_culc(current_user)
    team_term_point_culc(current_user)
  end

end
