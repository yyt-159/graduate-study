class ChangeColumnToUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :team_id, :integer
    add_reference :users, :team, foreign_key: true
  end
end
