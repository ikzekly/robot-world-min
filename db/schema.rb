# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_23_114112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_computers", force: :cascade do |t|
    t.bigint "car_id"
    t.string "defected_part"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_car_computers_on_car_id"
  end

  create_table "car_models", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_car_models_on_name", unique: true
  end

  create_table "cars", force: :cascade do |t|
    t.string "state", default: "new", null: false
    t.integer "year", limit: 2, null: false
    t.integer "wheels", limit: 2
    t.integer "seats", limit: 2
    t.integer "chassis", limit: 2
    t.integer "laser", limit: 2
    t.integer "computer", limit: 2
    t.integer "engine", limit: 2
    t.decimal "price", precision: 8, scale: 2, default: "0.0"
    t.decimal "cost_price", precision: 8, scale: 2, default: "0.0"
    t.boolean "checked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "car_model_id", null: false
    t.bigint "factory_stock_id"
    t.bigint "store_stock_id"
    t.index ["car_model_id"], name: "index_cars_on_car_model_id"
    t.index ["factory_stock_id"], name: "index_cars_on_factory_stock_id"
    t.index ["store_stock_id"], name: "index_cars_on_store_stock_id"
  end

  create_table "event_logs", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_event_logs_on_order_id"
  end

  create_table "factory_stocks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "car_model_id", null: false
    t.bigint "car_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_orders_on_car_id"
    t.index ["car_model_id"], name: "index_orders_on_car_model_id"
  end

  create_table "store_stocks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "car_computers", "cars", on_delete: :cascade
  add_foreign_key "cars", "car_models"
  add_foreign_key "cars", "factory_stocks"
  add_foreign_key "cars", "store_stocks"
  add_foreign_key "event_logs", "orders"
  add_foreign_key "orders", "car_models"
  add_foreign_key "orders", "cars"
end
