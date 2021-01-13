class User < ApplicationRecord
  has_many :comments
  has_many :shots
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
