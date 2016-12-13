class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :player1
      t.string :player2
      t.hstore :player1_ships_position, default: {}, null: false
      t.hstore :player2_ships_position, default: {}, null: false
      t.json :player1_hit_shot, default: {}, null: false
      t.json :player2_hit_shot, default: {}, null: false
      t.json :player1_miss_shot, default: {}, null: false
      t.json :player2_miss_shot, default: {}, null: false
      t.string :winner

      t.timestamps null: false
    end
  end
end
