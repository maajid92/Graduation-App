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

ActiveRecord::Schema.define(version: 2021_03_17_095345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctor_appointments", force: :cascade do |t|
    t.text "description"
    t.datetime "from"
    t.datetime "to"
    t.bigint "doctor_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["doctor_id"], name: "index_doctor_appointments_on_doctor_id"
    t.index ["user_id"], name: "index_doctor_appointments_on_user_id"
  end

  create_table "doctor_notifications", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.datetime "notified_on"
    t.text "notes"
    t.string "severity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_doctor_notifications_on_doctor_id"
    t.index ["user_id"], name: "index_doctor_notifications_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.string "username"
    t.string "password"
    t.text "address"
    t.string "primary_practice"
    t.string "secondary_practice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gcmid"
  end

  create_table "in_patients", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.datetime "visting_since"
    t.text "notes"
    t.string "status"
    t.string "for_practice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_in_patients_on_doctor_id"
    t.index ["user_id"], name: "index_in_patients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.string "username"
    t.string "password"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gcmid"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "provider", default: "", null: false
    t.string "uid", default: "", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "user_role", default: "patient"
    t.integer "status", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "doctor_notifications", "doctors"
  add_foreign_key "doctor_notifications", "users"
  add_foreign_key "in_patients", "doctors"
  add_foreign_key "in_patients", "users"
end
