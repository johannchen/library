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

ActiveRecord::Schema.define(version: 20150817064727) do

  create_table "books", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "author",     limit: 255
    t.text     "summary",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "mybooks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "book_id",    limit: 4
    t.string   "condition",  limit: 255
    t.float    "price",      limit: 24
    t.boolean  "share",                  default: true
    t.datetime "sold_at"
    t.string   "status",     limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "mybooks", ["book_id"], name: "index_mybooks_on_book_id", using: :btree
  add_index "mybooks", ["user_id"], name: "index_mybooks_on_user_id", using: :btree

  create_table "operations", id: false, force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "mybook_id",    limit: 4
    t.datetime "borrowed_at"
    t.datetime "returned_at"
    t.datetime "requested_at"
  end

  add_index "operations", ["mybook_id"], name: "index_operations_on_mybook_id", using: :btree
  add_index "operations", ["user_id"], name: "index_operations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.text     "bio",             limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "password_digest", limit: 255
  end

end
