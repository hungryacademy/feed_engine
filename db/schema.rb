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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20120509200823) do

  create_table "images", :force => true do |t|
    t.text     "description"
    t.text     "url"
    t.integer  "poster_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "images", ["poster_id"], :name => "index_images_on_poster_id"

  create_table "links", :force => true do |t|
    t.text     "description"
    t.text     "url"
    t.integer  "poster_id"
=======
ActiveRecord::Schema.define(:version => 20120509130221) do

  create_table "images", :force => true do |t|
    t.text     "url"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "links", :force => true do |t|
    t.text     "url"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.text     "description"
    t.integer  "user_id"
>>>>>>> d00136053c36fc8d3293956f46e2031a4bd05d7f
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

<<<<<<< HEAD
  add_index "links", ["poster_id"], :name => "index_links_on_poster_id"

  create_table "messages", :force => true do |t|
    t.text     "body"
    t.integer  "poster_id"
=======
  create_table "texts", :force => true do |t|
>>>>>>> d00136053c36fc8d3293956f46e2031a4bd05d7f
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "display_name"
  end

end
