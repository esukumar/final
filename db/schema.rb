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

  create_table "activities", force: :cascade do |t|
    t.string  "title"
    t.integer "price"
    t.integer "event_id"
  end

  add_index "activities", ["event_id"], name: "index_activities_on_event_id"

  create_table "comments", force: :cascade do |t|
    t.text    "desc"
    t.integer "note_id"
    t.integer "image_id"
  end

  add_index "comments", ["image_id"], name: "index_comments_on_image_id"
  add_index "comments", ["note_id"], name: "index_comments_on_note_id"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.string  "title"
    t.string  "picture"
    t.integer "event_id"
  end

  add_index "images", ["event_id"], name: "index_images_on_event_id"

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  add_index "notes", ["event_id"], name: "index_notes_on_event_id"

end
