# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_03_222631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.bigint "tuit_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tuit_id"], name: "index_comments_on_tuit_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "tuits", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "body"
    t.integer "like_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tuits_on_user_id"
  end

  create_table "tuits_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tuit_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password"
    t.string "name"
    t.string "email", null: false
    t.string "location"
    t.string "bio"
    t.integer "follow_count", default: 0
    t.integer "follower_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "tuits"
  add_foreign_key "comments", "users"
  add_foreign_key "tuits", "users"
end
