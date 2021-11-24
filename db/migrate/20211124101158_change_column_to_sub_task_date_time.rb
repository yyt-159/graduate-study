class ChangeColumnToSubTaskDateTime < ActiveRecord::Migration[6.0]
  # 変更内容
  def up
    change_column :sub_tasks, :target_at, :date
    change_column :sub_tasks, :completed_at, :date
  end

  # 変更前の状態
  def down
    change_column :sub_tasks, :target_at, :datetime
    change_column :sub_tasks, :completed_at, :datetime
  end
end
