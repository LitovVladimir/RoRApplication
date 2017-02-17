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

ActiveRecord::Schema.define(version: 20170217151817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.integer  "library_id",       null: false
    t.string   "name",             null: false
    t.string   "author"
    t.string   "cipher",           null: false
    t.string   "publishing_house"
    t.integer  "publishing_year"
    t.float    "price"
    t.date     "receipt_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["cipher"], name: "index_books_on_cipher", unique: true, using: :btree
    t.index ["library_id"], name: "index_books_on_library_id", using: :btree
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer  "book_id",       null: false
    t.integer  "subscriber_id", null: false
    t.date     "delivery_date", null: false
    t.date     "return_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["book_id"], name: "index_deliveries_on_book_id", using: :btree
    t.index ["subscriber_id"], name: "index_deliveries_on_subscriber_id", using: :btree
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "library_id",      null: false
    t.string   "last_name",       null: false
    t.string   "first_name",      null: false
    t.string   "patronymic"
    t.date     "DOB"
    t.date     "employment_date"
    t.string   "post",            null: false
    t.string   "education"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["library_id"], name: "index_employees_on_library_id", using: :btree
  end

  create_table "libraries", force: :cascade do |t|
    t.integer  "number",     null: false
    t.string   "name",       null: false
    t.string   "address",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.integer  "library_id",    null: false
    t.integer  "ticket_number", null: false
    t.string   "last_name",     null: false
    t.string   "first_name",    null: false
    t.string   "patronymic"
    t.string   "address",       null: false
    t.string   "phone",         null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["library_id"], name: "index_subscribers_on_library_id", using: :btree
    t.index ["ticket_number"], name: "index_subscribers_on_ticket_number", unique: true, using: :btree
  end

  add_foreign_key "books", "libraries"
  add_foreign_key "deliveries", "books"
  add_foreign_key "deliveries", "subscribers"
  add_foreign_key "employees", "libraries"
  add_foreign_key "subscribers", "libraries"
end
