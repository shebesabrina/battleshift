class AddForeignKeyToGames < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :games, :users, column: :player_1_id
    add_foreign_key :games, :users, column: :player_2_id
  end
end
