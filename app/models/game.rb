class Game < ApplicationRecord
  has_many :users, through: :user_sessions
  has_many :user_sessions
  has_many :attempts
end
