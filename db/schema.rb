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

ActiveRecord::Schema.define(version: 20170528060852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.string   "searchable_type"
    t.integer  "searchable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",         null: false
    t.string   "description"
    t.integer  "area"
    t.integer  "category_type"
    t.integer  "price",         null: false
    t.string   "location"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["area"], name: "index_products_on_area", using: :btree
    t.index ["category_type"], name: "index_products_on_category_type", using: :btree
    t.index ["description"], name: "index_products_on_description", using: :btree
    t.index ["location"], name: "index_products_on_location", using: :btree
    t.index ["price"], name: "index_products_on_price", using: :btree
    t.index ["title"], name: "index_products_on_title", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name",       null: false
    t.string   "email",           null: false
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["full_name"], name: "index_users_on_full_name", using: :btree
  end

  add_foreign_key "products", "users"
end
