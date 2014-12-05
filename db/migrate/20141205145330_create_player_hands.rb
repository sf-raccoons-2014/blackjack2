class CreatePlayerHands < ActiveRecord::Migration
  def change
    create_table :player_hands do |t|
      t.integer :player_id
      t.integer :hand_id
    end
  end
end
