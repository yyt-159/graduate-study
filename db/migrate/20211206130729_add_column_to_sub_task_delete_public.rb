class AddColumnToSubTaskDeletePublic < ActiveRecord::Migration[6.0]
  def change
        # 削除
        remove_column :sub_tasks, :description, :string
        remove_column :sub_tasks, :target_at, :date
        remove_column :sub_tasks, :public_sub_task, :boolean
  end
end
