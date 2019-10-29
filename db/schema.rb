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

ActiveRecord::Schema.define(version: 2019_10_28_225217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "condition"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.bigint "system_id"
    t.bigint "year_id"
    t.bigint "condition_id"
    t.boolean "data_wiped"
    t.integer "is_donated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "machine_id"
    t.string "location"
    t.index ["condition_id"], name: "index_listings_on_condition_id"
    t.index ["machine_id"], name: "index_listings_on_machine_id"
    t.index ["system_id"], name: "index_listings_on_system_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
    t.index ["year_id"], name: "index_listings_on_year_id"
  end

  create_table "machines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "systems", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "years", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "name"
  end

  add_foreign_key "listings", "conditions"
  add_foreign_key "listings", "machines"
  add_foreign_key "listings", "systems"
  add_foreign_key "listings", "users"
  add_foreign_key "listings", "years"
  add_foreign_key "users", "roles"
end
