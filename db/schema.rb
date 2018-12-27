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

ActiveRecord::Schema.define(version: 2018_12_27_173446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parkings", force: :cascade do |t|
    t.string "street_name"
    t.string "start_cross_street"
    t.string "end_cross_street"
    t.string "side_of_street"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "curb_id"
    t.boolean "legal"
    t.index ["user_id"], name: "index_parkings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "google_token"
    t.string "uid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "parkings", "users"
end
