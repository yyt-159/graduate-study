class ChangeColumnToUserDefNumber < ActiveRecord::Migration[6.0]
  # 変更内容
  def up
    change_column :users, :target_point, :integer, default: 0
    change_column :users, :term_point, :integer, default: 0
    change_column :users, :total_done_task, :integer, default: 0
  end

  # 変更前の状態
  def down
    change_column :users, :target_point, :integer
    change_column :users, :term_point, :integer
    change_column :users, :total_done_task, :integer
  end
end
