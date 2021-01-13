class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :shot
  validates :reply, presence: true
end
