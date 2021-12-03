class AddColumnToTaskDoneTimes < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :done_times, :integer, default: 0
  end
end
