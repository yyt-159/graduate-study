class Team < ApplicationRecord
  # ユーザーとの連携
  has_many :users, dependent: :destroy
end
