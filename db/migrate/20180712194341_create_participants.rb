class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
