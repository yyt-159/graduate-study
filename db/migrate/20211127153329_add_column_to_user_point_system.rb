class AddColumnToUserPointSystem < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :target_point, :integer
    add_column :users, :term_point, :integer
    add_column :users, :total_done_task, :integer
  end
end
