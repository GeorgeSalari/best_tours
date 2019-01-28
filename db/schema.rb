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

ActiveRecord::Schema.define(version: 20181216001419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avia_tours", force: :cascade do |t|
    t.string "title"
    t.string "short_content"
    t.string "content"
    t.integer "adult_price"
    t.integer "child_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "images"
    t.integer "order_number"
  end

  create_table "boats", force: :cascade do |t|
    t.string "title"
    t.string "short_content"
    t.string "content"
    t.integer "adult_price"
    t.integer "child_price"
    t.json "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_number"
  end

  create_table "call_orders", force: :cascade do |t|
    t.text "call_type", default: [], array: true
    t.string "customer_name"
    t.string "customer_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "product_id"
    t.string "product_type"
    t.integer "cart_id"
    t.integer "quantity"
    t.integer "adult_count"
    t.integer "child_count"
    t.date "booking_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "customer_name"
    t.string "customer_email"
    t.string "comment"
    t.json "avatar"
    t.json "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tour_id"
    t.string "tour_type"
  end

  create_table "evening_shows", force: :cascade do |t|
    t.string "title"
    t.string "short_content"
    t.string "content"
    t.integer "adult_price"
    t.integer "child_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "images"
    t.integer "order_number"
  end

  create_table "individual_tours", force: :cascade do |t|
    t.string "title"
    t.string "short_content"
    t.string "content"
    t.integer "adult_price"
    t.integer "child_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "images"
  end

  create_table "land_tours", force: :cascade do |t|
    t.string "title"
    t.string "short_content"
    t.string "content"
    t.integer "adult_price"
    t.integer "child_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "images"
    t.integer "order_number"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "product_id"
    t.string "product_type"
    t.integer "quantity"
    t.integer "adult_count"
    t.integer "child_count"
    t.date "booking_date"
    t.string "customer_name"
    t.string "customer_phone"
    t.string "customer_email"
    t.string "customer_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phuket_tours", force: :cascade do |t|
    t.string "title"
    t.string "short_content"
    t.string "content"
    t.integer "adult_price"
    t.integer "child_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "images"
    t.integer "order_number"
  end

  create_table "sea_tours", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "short_content"
    t.string "content"
    t.integer "adult_price", default: 0
    t.integer "child_price", default: 0
    t.json "images"
    t.integer "order_number"
  end

  create_table "shops", force: :cascade do |t|
    t.string "title"
    t.string "short_content"
    t.string "content"
    t.integer "adult_price"
    t.integer "child_price"
    t.json "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_number"
  end

  create_table "static_pages", force: :cascade do |t|
    t.string "title"
    t.string "short_content"
    t.string "content"
    t.integer "adult_price"
    t.integer "child_price"
    t.json "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
