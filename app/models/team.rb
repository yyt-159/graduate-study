class Team < ApplicationRecord
  # ユーザーとの連携
  has_many :users
end