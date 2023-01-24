# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_24_115211) do
  create_table "month_lines", force: :cascade do |t|
    t.integer "month_id", null: false
    t.integer "type_id", null: false
    t.string "concept"
    t.decimal "value"
    t.string "additional_info"
    t.boolean "paid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id"], name: "index_month_lines_on_month_id"
    t.index ["type_id"], name: "index_month_lines_on_type_id"
  end

  create_table "months", force: :cascade do |t|
    t.boolean "active", default: false
    t.decimal "final_balance", default: "0.0"
    t.decimal "total_debt", default: "0.0"
    t.date "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_group_id", null: false
    t.index ["user_group_id"], name: "index_months_on_user_group_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "color"
    t.integer "operator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_group_id", null: false
    t.index ["user_group_id"], name: "index_types_on_user_group_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_groups_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "user_group_id"
    t.index ["user_group_id"], name: "index_user_groups_users_on_user_group_id"
    t.index ["user_id"], name: "index_user_groups_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "month_lines", "months"
  add_foreign_key "month_lines", "types"
  add_foreign_key "months", "user_groups"
  add_foreign_key "types", "user_groups"
end
