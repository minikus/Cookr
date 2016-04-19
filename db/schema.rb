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

ActiveRecord::Schema.define(version: 20160419022840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.datetime "time"
    t.string   "suburb"
    t.string   "address"
    t.integer  "user_id"
    t.integer  "chef_id"
    t.integer  "menu_id"
    t.text     "description"
    t.integer  "guests"
    t.boolean  "confirm"
    t.float    "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "cuisine"
    t.text     "description"
    t.float    "pricePP"
    t.text     "dietry"
    t.boolean  "gluten_free"
    t.boolean  "vego"
    t.string   "title"
    t.text     "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "target"
    t.text     "message"
    t.boolean  "seen"
    t.boolean  "archive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "target"
    t.integer  "rating"
    t.text     "review"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "reviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "password_digest"
    t.string   "email"
    t.boolean  "admin"
    t.boolean  "chef"
    t.string   "phone"
    t.text     "image"
    t.text     "bio"
    t.float    "rate"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
