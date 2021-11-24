class SubTask < ApplicationRecord
  belongs_to :task, optional: true
  # ユーザーと連携取れるように(masterの意味はわかっていない)
  has_one :master, through: :task 
end
