class Game < ApplicationRecord
  attr_accessor :messages
  has_many :participants
  has_many :users, through: :participants

  enum current_turn: ["player_1", "player_2"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def player_1
    users.joins(:participants).where(participants: {role:0})
  end

  def player_2
    users.joins(:participants).where(participants: {role:1})
  end
end
