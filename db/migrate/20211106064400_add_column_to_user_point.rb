class AddColumnToUserPoint < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_gain_point, :integer
    add_column :users, :team_id, :integer
  end
end
