class Round < ApplicationRecord
  belongs_to :game
  belongs_to :player_one, class_name: "User" 
  belongs_to :player_two, class_name: "User"
end
