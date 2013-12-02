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

ActiveRecord::Schema.define(version: 20131201234639) do

  create_table "books", force: true do |t|
    t.string   "title",      null: false
    t.string   "ISBN",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["ISBN"], name: "index_books_on_ISBN"
  add_index "books", ["title"], name: "index_books_on_title"

  create_table "libraries", force: true do |t|
    t.string   "name",         null: false
    t.string   "address",      null: false
    t.string   "address_cont"
    t.string   "city",         null: false
    t.string   "state",        null: false
    t.string   "zip",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "libraries", ["name"], name: "index_libraries_on_name"

  create_table "library_books", force: true do |t|
    t.integer  "library_id"
    t.integer  "book_id"
    t.integer  "request_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
