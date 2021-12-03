class ChangeColumnToUserGainPointDef < ActiveRecord::Migration[6.0]
  # 変更内容
  def up
    change_column :users, :user_gain_point, :integer, default: 0
  end

  # 変更前の状態
  def down
    change_column :users, :user_gain_point, :integer
  end
end
