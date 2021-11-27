module TasksHelper
# コピー用↓
# 関数名:
# 引数:
# 説明:
# 使用場所:

# 関数名:task_progress_calcu(task)
# 引数:メインタスク
# 説明:メインタスクの進捗を表示します。%の数字を返します。
# 使用場所: app/views/tasks/show.html.erb, app/views/tasks/index.html.erb, app/views/team/index.html.erb
  def task_progress_calcu(task)
    # タスクの中のサブタスクを全て取得
    sub_tasks = task.sub_tasks.all
    # タスクの持つサブタスクの数を取得
    sub_task_num = sub_tasks.length
    if sub_task_num == 0
      return 
    end
    # サブタスクそれぞれが完了してるか確認
    done_sub_task_num = 0
    sub_tasks.each do |sub_task|
      done_sub_task_num += 1  if sub_task.completed 
    end
    # ％に表示
    result = done_sub_task_num.to_f/sub_task_num.to_f
    calcu_result = result.round(3)*100
    return "#{calcu_result.round(3)}%"
  end
end
