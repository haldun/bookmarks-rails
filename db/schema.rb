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

ActiveRecord::Schema.define(:version => 20110809062500) do

  create_table "bookmarks", :force => true do |t|
    t.integer  "user_id"
    t.string   "uri"
    t.string   "uri_digest"
    t.string   "title"
    t.text     "description"
    t.boolean  "is_private",   :default => false
    t.boolean  "is_starred",   :default => false
    t.boolean  "is_unread",    :default => false
    t.text     "raw_content"
    t.text     "text_content"
    t.datetime "cached_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookmarks", ["is_private"], :name => "index_bookmarks_on_is_private"
  add_index "bookmarks", ["is_starred"], :name => "index_bookmarks_on_is_starred"
  add_index "bookmarks", ["is_unread"], :name => "index_bookmarks_on_is_unread"
  add_index "bookmarks", ["uri_digest"], :name => "index_bookmarks_on_uri_digest"
  add_index "bookmarks", ["user_id"], :name => "index_bookmarks_on_user_id"

  create_table "imports", :force => true do |t|
    t.integer  "user_id"
    t.string   "file"
    t.datetime "processed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "imports", ["user_id"], :name => "index_imports_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "nickname"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["nickname"], :name => "index_users_on_nickname"

end
