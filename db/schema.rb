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

ActiveRecord::Schema.define(version: 20161108112103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.date     "date"
    t.string   "timeslot"
    t.integer  "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "status"
    t.index ["board_id"], name: "index_availabilities_on_board_id", using: :btree
  end

  create_table "boards", force: :cascade do |t|
    t.text     "description"
    t.integer  "price"
    t.string   "category"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_boards_on_user_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "availability_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["availability_id"], name: "index_bookings_on_availability_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "board_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_reviews_on_board_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "role"
    t.string   "address"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_foreign_key "availabilities", "boards"
  add_foreign_key "boards", "users"
  add_foreign_key "bookings", "availabilities"
  add_foreign_key "bookings", "users"
  add_foreign_key "reviews", "boards"
  add_foreign_key "reviews", "users"
end
