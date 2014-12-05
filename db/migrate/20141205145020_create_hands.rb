class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.string :value
    end
  end
end
