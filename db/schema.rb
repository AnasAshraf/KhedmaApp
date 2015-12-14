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

ActiveRecord::Schema.define(version: 20151214152050) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", id: false, force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "buddy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friends", ["user_id", "buddy"], name: "index_friends_on_user_id_and_buddy"

  create_table "items", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "weight",      null: false
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lendings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lendee"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pendingItemRequests", force: :cascade do |t|
    t.integer  "lendee"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pendingItemRequests", ["lendee", "item_id"], name: "index_pendingItemRequests_on_lendee_and_Item_id"

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username",                null: false
    t.string   "email",                   null: false
    t.string   "password",                null: false
    t.boolean  "gender"
    t.string   "photo",      default: ""
    t.integer  "points",     default: 0
    t.string   "city"
    t.string   "country"
    t.date     "date_birth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["username"], name: "index_users_on_username"

end
