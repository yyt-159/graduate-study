class AddColumnToSubTaskDoneTimes < ActiveRecord::Migration[6.0]
  def change
    add_column :sub_tasks, :done_times, :integer, default: 0
  end
end
