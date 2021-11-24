class CreateSubTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_tasks do |t|
           # タイトル
           t.string :title, null: false
           # 説明
           t.text :description, null: true
           # 締め切り
           t.datetime :target_at, null: true
           # タスク完了日
           t.datetime :completed_at, null: true
           # タスク完了したか
           t.boolean :completed, null: false, default: false
           # userモデルのuser_idに結びつけるため、必要
           t.references :task, foreign_key: true
           # サブタスクを公開するかの設定
           t.boolean :public_sub_task, null: false
      t.timestamps
    end
  end
end
