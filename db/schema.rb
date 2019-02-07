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

ActiveRecord::Schema.define(version: 2019_02_07_100945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_types", force: :cascade do |t|
    t.string "main_type"
    t.string "subtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["main_type", "subtype"], name: "index_contact_types_on_main_type_and_subtype", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "contact_type_id"
    t.text "data", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_type_id"], name: "index_contacts_on_contact_type_id"
    t.index ["organization_id"], name: "index_contacts_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contacts", "contact_types"
  add_foreign_key "contacts", "organizations"
  add_foreign_key "organizations", "users"
end
