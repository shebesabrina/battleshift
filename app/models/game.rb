class Game < ApplicationRecord
  attr_accessor :messages
  has_many :participants
  has_many :users, through: :participants

  enum current_turn: ["player_1", "player_2"]
  serialize :player_1_board
  serialize :player_2_board

  validates :player_1_board, presence: true
  validates :player_2_board, presence: true

  def vs_ai?
    users.count < 2
  end
  
  def over?
    check_winner
    !self.winner.nil?
  end

  def check_winner
    if player_1_board.is_lost?
      unless vs_ai?
        self.winner = player_2.email
      else 
        self.winner = "Computer"
      end
    elsif player_2_board.is_lost?
      self.winner = player_1.email
    end
  end
  
  def switch_turn
    if self.current_turn == "player_1"
      self.current_turn = "player_2"
    else
      self.current_turn = "player_1"
    end
  end

  def player_1
    users.joins(:participants).where(participants: {role:0}).first
  end

  def player_2
    users.joins(:participants).where(participants: {role:1}).first
  end
end
