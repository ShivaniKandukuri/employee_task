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

ActiveRecord::Schema.define(version: 2022_08_16_121319) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "blogs", force: :cascade do |t|
    t.text "post"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "organization_id"
    t.index ["organization_id"], name: "index_blogs_on_organization_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "blog_id"
    t.integer "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id"
    t.index ["employee_id"], name: "index_comments_on_employee_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "organization_id", null: false
    t.index ["organization_id"], name: "index_devices_on_organization_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "salary"
    t.integer "age"
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "organization_id", null: false
    t.string "email"
    t.string "password_digest"
    t.integer "device_id"
    t.date "dateofjoining"
    t.text "address"
    t.integer "mobilenumber"
    t.integer "team_id"
    t.integer "role_id"
    t.index ["device_id"], name: "index_employees_on_device_id"
    t.index ["organization_id"], name: "index_employees_on_organization_id"
    t.index ["role_id"], name: "index_employees_on_role_id"
    t.index ["team_id"], name: "index_employees_on_team_id"
  end

  create_table "idcards", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.integer "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "organization_id"
    t.index ["employee_id"], name: "index_idcards_on_employee_id"
    t.index ["organization_id"], name: "index_idcards_on_organization_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.integer "employee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_images_on_employee_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "blog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blog_id"], name: "index_likes_on_blog_id"
    t.index ["employee_id"], name: "index_likes_on_employee_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payslips", force: :cascade do |t|
    t.integer "takehome"
    t.integer "deductions"
    t.integer "grosspay"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "house_rent"
    t.integer "basic"
    t.integer "conveyence"
    t.integer "fixed"
    t.integer "medical"
    t.integer "professional_tax"
    t.integer "epf_contribution"
    t.integer "organization_id"
    t.integer "employee_id"
    t.index ["employee_id"], name: "index_payslips_on_employee_id"
    t.index ["organization_id"], name: "index_payslips_on_organization_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.integer "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_roles_on_organization_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "added_by"
    t.integer "organization_id"
    t.index ["organization_id"], name: "index_teams_on_organization_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blogs", "organizations"
  add_foreign_key "comments", "blogs"
  add_foreign_key "comments", "employees"
  add_foreign_key "devices", "organizations"
  add_foreign_key "employees", "devices"
  add_foreign_key "employees", "organizations"
  add_foreign_key "employees", "roles"
  add_foreign_key "employees", "teams"
  add_foreign_key "idcards", "employees"
  add_foreign_key "idcards", "organizations"
  add_foreign_key "images", "employees"
  add_foreign_key "likes", "blogs"
  add_foreign_key "likes", "employees"
  add_foreign_key "payslips", "employees"
  add_foreign_key "payslips", "organizations"
  add_foreign_key "roles", "organizations"
  add_foreign_key "teams", "organizations"
end
