class Task < ApplicationRecord
  # user一つに紐付いている
  belongs_to :user, optional: true
  # サブタスクを1対多で持つ
  has_many :sub_tasks , dependent: :destroy

  validates :title, presence: true
  validates :target_at, presence: true
end
