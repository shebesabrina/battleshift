class Participant < ApplicationRecord
  belongs_to :game
  belongs_to :user

  # this value will default to player_1
  enum role: [:player_1, :player_2]
end
