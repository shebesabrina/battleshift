class AddPlayersToGames < ActiveRecord::Migration[5.1]
  def change
    add_reference :games, :player_1, index:true
    add_reference :games, :player_2, index:true
  end
end
