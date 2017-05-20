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

ActiveRecord::Schema.define(version: 20170518121642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "seo_url"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "option_products", force: :cascade do |t|
    t.string   "thumb"
    t.string   "title"
    t.decimal  "price",       precision: 5, scale: 2
    t.integer  "weight"
    t.integer  "size"
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["category_id"], name: "index_option_products_on_category_id", using: :btree
    t.index ["product_id"], name: "index_option_products_on_product_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.string   "title"
    t.decimal  "unit_price",      precision: 5, scale: 2
    t.integer  "quantity"
    t.decimal  "sub_total_price", precision: 5, scale: 2
    t.string   "product_type"
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
    t.index ["product_type", "product_id"], name: "index_order_items_on_product_type_and_product_id", using: :btree
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "total_price",     precision: 5, scale: 2
    t.integer  "order_status_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  end

  create_table "product_images", force: :cascade do |t|
    t.string   "image"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "weight"
    t.integer  "size"
    t.decimal  "price",       precision: 5, scale: 2
    t.integer  "category_id"
    t.boolean  "active"
    t.string   "status"
    t.string   "thumb"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

end
