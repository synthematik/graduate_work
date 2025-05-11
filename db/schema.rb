ActiveRecord::Schema[7.2].define(version: 2025_05_11_105233) do
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_departments_on_name"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "degree"
    t.string "rank"
    t.string "description"
    t.json "links"
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.string "location"
    t.datetime "starts_at", null: false
    t.datetime "ends_at"
    t.boolean "published", default: true
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["published"], name: "index_events_on_published"
    t.index ["starts_at"], name: "index_events_on_starts_at"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.boolean "published", default: true
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["published"], name: "index_notifications_on_published"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title"
    t.integer "course_number"
    t.string "education_form"
    t.string "semester_type"
    t.string "schedule_type"
    t.integer "start_year"
    t.integer "end_year"
    t.text "file_url"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_year"], name: "index_schedules_on_end_year"
    t.index ["start_year"], name: "index_schedules_on_start_year"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token_digest"
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["login"], name: "index_users_on_login"
    t.index ["remember_me_token_digest"], name: "index_users_on_remember_me_token_digest"
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "articles", "users"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "users"
  add_foreign_key "events", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "schedules", "users"
end
