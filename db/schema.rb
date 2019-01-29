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

ActiveRecord::Schema.define(version: 2019_02_04_162936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_types", force: :cascade do |t|
    t.string "title"
    t.string "subtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title", "subtype"], name: "index_contact_types_on_title_and_subtype", unique: true
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
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contacts", "contact_types"
  add_foreign_key "contacts", "organizations"
  add_foreign_key "organizations", "users"
end
