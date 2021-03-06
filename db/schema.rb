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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
  end

  create_table "comments", force: :cascade do |t|
    t.text    "desc"
    t.integer "note_id"
    t.integer "image_id"
    t.integer "user_id"
  end

  add_index "comments", ["image_id"], name: "index_comments_on_image_id", using: :btree
  add_index "comments", ["note_id"], name: "index_comments_on_note_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "event_activities", force: :cascade do |t|
    t.integer "event_id"
    t.integer "activity_id"
  end

  add_index "event_activities", ["activity_id"], name: "index_event_activities_on_activity_id", using: :btree
  add_index "event_activities", ["event_id"], name: "index_event_activities_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "title"
    t.string   "picture"
    t.integer  "event_id"
    t.datetime "created_at"
  end

  add_index "images", ["event_id"], name: "index_images_on_event_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  add_index "notes", ["event_id"], name: "index_notes_on_event_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
  end

end
