class ChangeColumnToTaskTitleDef < ActiveRecord::Migration[6.0]
  # 変更内容
  def up
    change_column :tasks, :title, :string
    change_column :sub_tasks, :title, :string
  end

  # 変更前の状態
  def down
    change_column :tasks, :title, :string, null: false
    change_column :sub_tasks, :title, :string, null: false
  end
end
