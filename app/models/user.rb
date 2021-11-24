class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 1対多でタスクに紐付いている
  has_many :tasks, dependent: :destroy
  # サブタスクと連携取れるように
  has_many :sub_tasks,through: :sub_tasks, dependent: :destroy
  # チームとの連携
  belongs_to :team
end
