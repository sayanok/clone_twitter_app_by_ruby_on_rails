# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_04_04_140951) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tweet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tweet_id", "user_id"], name: "index_favorites_on_tweet_id_and_user_id", unique: true
    t.index ["tweet_id"], name: "index_favorites_on_tweet_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.integer "user_id"
    t.string "tweet_text", limit: 140
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "favorites_count", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "account", null: false
    t.string "user_name", null: false
    t.text "description"
    t.string "password_digest", null: false
    t.date "birth_of_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account"], name: "index_users_on_account", unique: true
  end

  add_foreign_key "favorites", "tweets"
  add_foreign_key "favorites", "users"
  add_foreign_key "tweets", "users"
end
