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

ActiveRecord::Schema.define(version: 2020_09_10_065826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_channels_on_name"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_favorites_on_show_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "shows", force: :cascade do |t|
    t.bigint "channel_id"
    t.string "name"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_shows_on_channel_id"
    t.index ["name"], name: "index_shows_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "favorites", "shows"
  add_foreign_key "favorites", "users"
  add_foreign_key "shows", "channels"
end
