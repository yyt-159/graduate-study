class AddColumnToPointUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :points, :user_id, :integer
    add_reference :points, :user, foreign_key: true
  end
end
