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

ActiveRecord::Schema.define(version: 2021_02_10_003310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "day_stickers", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.bigint "sticker_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_day_stickers_on_day_id"
    t.index ["sticker_id"], name: "index_day_stickers_on_sticker_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_days_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.string "context"
    t.string "text_color"
    t.string "image"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "context"
    t.string "text_color"
    t.string "image"
    t.bigint "day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_posts_on_day_id"
  end

  create_table "stickers", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stickers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "bio"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "day_stickers", "days"
  add_foreign_key "day_stickers", "stickers"
  add_foreign_key "days", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "posts", "days"
  add_foreign_key "stickers", "users"
end
