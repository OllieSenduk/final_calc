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

ActiveRecord::Schema.define(version: 2020_10_15_081544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "connection_years", force: :cascade do |t|
    t.bigint "year_id", null: false
    t.bigint "connection_id", null: false
    t.integer "kwh"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "kwh_storage"
    t.index ["connection_id"], name: "index_connection_years_on_connection_id"
    t.index ["year_id"], name: "index_connection_years_on_year_id"
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_connections_on_company_id"
  end

  create_table "tax_credits", force: :cascade do |t|
    t.string "year"
    t.float "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "years", force: :cascade do |t|
    t.string "name"
    t.integer "tier_1_price"
    t.integer "tier_2_price"
    t.integer "tier_3_price"
    t.integer "tier_4_price"
    t.integer "tier_5_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "tier_1_storage_price"
    t.float "tier_2_storage_price"
    t.float "tier_3_storage_price"
    t.float "tier_4_storage_price"
    t.float "tier_5_storage_price"
  end

  add_foreign_key "connection_years", "connections"
  add_foreign_key "connection_years", "years"
  add_foreign_key "connections", "companies"
end
