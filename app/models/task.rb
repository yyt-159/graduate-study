class Task < ApplicationRecord
  # user一つに紐付いている
  belongs_to :user
  # サブタスクを1対多で持つ
  has_many :sub_tasks , dependent: :destroy
end
