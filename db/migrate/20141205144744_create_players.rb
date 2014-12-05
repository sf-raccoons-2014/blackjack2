class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :count
    end
  end
end
