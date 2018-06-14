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

ActiveRecord::Schema.define(version: 20180614075737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "title"
    t.integer "hires_per_year"
    t.string "name"
    t.string "phone"
    t.string "country"
    t.string "city"
    t.integer "postal_code"
    t.text "payment_info"
    t.text "about"
    t.text "why_join_us"
    t.string "website"
    t.string "industry"
    t.integer "number_of_employee"
    t.text "logo"
    t.text "photo0"
    t.text "photo1"
    t.text "photo2"
    t.text "photo3"
    t.text "photo4"
    t.text "photo5"
    t.text "photo6"
    t.text "photo7"
    t.text "photo8"
    t.text "photo9"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_areas", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_types", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.integer "salary_min"
    t.integer "salary_max"
    t.integer "hires"
    t.text "description"
    t.string "email"
    t.text "address"
    t.integer "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "job_area_id"
    t.bigint "job_type_id"
    t.bigint "education_id"
    t.bigint "user_id"
    t.index ["education_id"], name: "index_jobs_on_education_id"
    t.index ["job_area_id"], name: "index_jobs_on_job_area_id"
    t.index ["job_type_id"], name: "index_jobs_on_job_type_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "companies", "users"
  add_foreign_key "jobs", "educations"
  add_foreign_key "jobs", "job_areas"
  add_foreign_key "jobs", "job_types"
  add_foreign_key "jobs", "users"
end
