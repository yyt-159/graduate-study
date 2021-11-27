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
  end#タスクの方でも書いた。ドライじゃなくてすみません。

end
