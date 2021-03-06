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

ActiveRecord::Schema.define(version: 20160729023510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "title",              null: false
    t.string   "author",             null: false
    t.string   "standard",           null: false
    t.string   "subject",            null: false
    t.string   "language",           null: false
    t.string   "message"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "status"
    t.integer  "user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "book_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "volunteer_id"
  end

  add_index "carts", ["book_id"], name: "index_carts_on_book_id", using: :btree

  create_table "delivery_infos", force: :cascade do |t|
    t.integer  "cart_id"
    t.string   "delivered_to"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "delivery_infos", ["cart_id"], name: "index_delivery_infos_on_cart_id", using: :btree

  create_table "institutions", force: :cascade do |t|
    t.integer  "cart_id"
    t.string   "institution_name"
    t.string   "institution_level"
    t.string   "institution_address"
    t.string   "status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "institutions", ["cart_id"], name: "index_institutions_on_cart_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteers", force: :cascade do |t|
    t.string   "departure_date"
    t.string   "arrival_date"
    t.string   "destination_country"
    t.string   "destination_city"
    t.string   "destination_province"
    t.string   "message"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
  end

  add_foreign_key "carts", "books"
  add_foreign_key "carts", "volunteers", on_delete: :cascade
  add_foreign_key "delivery_infos", "carts"
  add_foreign_key "institutions", "carts"
  add_foreign_key "volunteers", "users", on_delete: :cascade
end
