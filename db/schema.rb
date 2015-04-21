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

ActiveRecord::Schema.define(version: 20150421071511) do

  create_table "calendars", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.integer  "like_count"
    t.boolean  "is_public"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "official_id"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_index "calendars", ["official_id"], name: "index_calendars_on_official_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "place"
    t.boolean  "is_all_day"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "link"
    t.text     "note"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "calendar_id"
    t.integer  "like_count"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_index "events", ["calendar_id"], name: "index_events_on_calendar_id", using: :btree

  create_table "officials", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.boolean  "is_company"
    t.integer  "like_count"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "verified"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_index "officials", ["email"], name: "index_officials_on_email", unique: true, using: :btree
  add_index "officials", ["reset_password_token"], name: "index_officials_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "uid"
    t.string   "provider"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

  create_table "users_calendars", force: true do |t|
    t.integer "user_id",     null: false
    t.integer "calendar_id", null: false
  end

  create_table "users_events", force: true do |t|
    t.integer "user_id",  null: false
    t.integer "event_id", null: false
  end

  create_table "users_officials", force: true do |t|
    t.integer "user_id",     null: false
    t.integer "official_id", null: false
  end

end
