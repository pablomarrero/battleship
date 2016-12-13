# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161213201652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "games", force: :cascade do |t|
    t.string   "player1"
    t.string   "player2"
    t.hstore   "player1_ships_position", default: {}, null: false
    t.hstore   "player2_ships_position", default: {}, null: false
    t.json     "player1_hit_shot",       default: {}, null: false
    t.json     "player2_hit_shot",       default: {}, null: false
    t.json     "player1_miss_shot",      default: {}, null: false
    t.json     "player2_miss_shot",      default: {}, null: false
    t.string   "winner"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

end
