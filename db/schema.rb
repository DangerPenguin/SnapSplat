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

ActiveRecord::Schema.define(:version => 20130913021849) do

  create_table "follows", :force => true do |t|
    t.integer  "follower_id",  :null => false
    t.integer  "following_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "follows", ["follower_id"], :name => "index_follows_on_follower_id"
  add_index "follows", ["following_id"], :name => "index_follows_on_following_id"

  create_table "photos", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "caption"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "url",        :null => false
  end

  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",           :null => false
    t.string   "password_digest",    :null => false
    t.string   "session_token",      :null => false
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "tagline"
    t.text     "blurb"
    t.string   "profile_picture_id"
  end

  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
