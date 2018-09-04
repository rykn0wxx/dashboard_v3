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

ActiveRecord::Schema.define(version: 2018_09_04_041836) do

  create_table "dim_languages", force: :cascade do |t|
    t.string "language_name", limit: 20
    t.string "language_code", limit: 5
    t.integer "dim_region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dim_region_id"], name: "index_dim_languages_on_dim_region_id"
  end

  create_table "dim_projects", force: :cascade do |t|
    t.string "project_name", limit: 100
    t.integer "dim_site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dim_site_id"], name: "index_dim_projects_on_dim_site_id"
  end

  create_table "dim_regions", force: :cascade do |t|
    t.string "region_name", limit: 50
    t.string "region_code", limit: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dim_sites", force: :cascade do |t|
    t.string "site_name", limit: 50
    t.string "site_code", limit: 10
    t.integer "dim_region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dim_region_id"], name: "index_dim_sites_on_dim_region_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
