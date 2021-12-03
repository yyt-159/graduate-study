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

ActiveRecord::Schema.define(version: 2021_12_03_150115) do

  create_table "points", force: :cascade do |t|
    t.integer "point"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_points_on_user_id"
  end

  create_table "set_terms", force: :cascade do |t|
    t.date "term"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sub_tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "target_at"
    t.date "completed_at"
    t.boolean "completed", default: false, null: false
    t.integer "task_id"
    t.boolean "public_sub_task", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "done_times", default: 0
    t.index ["task_id"], name: "index_sub_tasks_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "target_at"
    t.date "completed_at"
    t.boolean "completed", default: false, null: false
    t.integer "user_id"
    t.boolean "public_task", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "done_times", default: 0
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "team_total_point", default: 0
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
    t.string "username"
    t.integer "user_gain_point", default: 0
    t.integer "team_id", default: 1
    t.boolean "admin", default: false
    t.integer "target_point", default: 0
    t.integer "term_point", default: 0
    t.integer "total_done_task", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "points", "users"
  add_foreign_key "sub_tasks", "tasks"
  add_foreign_key "tasks", "users"
  add_foreign_key "users", "teams"
end
