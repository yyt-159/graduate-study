class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.integer :team_total_point,default: 0
      t.timestamps
    end
  end
end
