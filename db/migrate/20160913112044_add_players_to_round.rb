class AddPlayersToRound < ActiveRecord::Migration[5.0]
  def change
    add_column :rounds, :player_one_id, :integer
    add_column :rounds, :player_two_id, :integer
    add_foreign_key :rounds, :users, column: "player_one_id"
    add_foreign_key :rounds, :users, column: "player_two_id"
    add_index :rounds, :player_one_id
    add_index :rounds, :player_two_id
  end
end
