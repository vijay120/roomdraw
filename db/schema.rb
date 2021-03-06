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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130315042640) do

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "room_id"
  end

  create_table "request_rooms", :force => true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group"
    t.integer  "priority"
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "size"
    t.integer  "group_count"
    t.integer  "floor"
    t.string   "alpha"
    t.boolean  "locked"
    t.text     "comment"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cohort"
    t.decimal  "draw_number"
  end

end
