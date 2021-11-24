class ChangeColumnToUserTeamId < ActiveRecord::Migration[6.0]
  # 変更内容
  def up
    change_column :users, :team_id, :integer,default: 1
  end

  # 変更前の状態
  def down
    change_column :users, :team_id, :integer
  end
end
