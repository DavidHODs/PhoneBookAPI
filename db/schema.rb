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

ActiveRecord::Schema.define(version: 2022_01_07_101748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_group", id: :serial, force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.index ["name"], name: "auth_group_name_a6ea08ec_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "auth_group_name_key", unique: true
  end

  create_table "auth_group_permissions", id: :serial, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_0cd325b0_uniq", unique: true
    t.index ["group_id"], name: "auth_group_permissions_group_id_b120cbf9"
    t.index ["permission_id"], name: "auth_group_permissions_permission_id_84c5c92e"
  end

  create_table "auth_permission", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_01ab375a_uniq", unique: true
    t.index ["content_type_id"], name: "auth_permission_content_type_id_2f476e4b"
  end

  create_table "cat_posts", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contact_apps", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "phonenumber"
    t.string "address"
    t.string "sex"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "django_admin_log", id: :serial, force: :cascade do |t|
    t.timestamptz "action_time", null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.integer "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id_c4bce8eb"
    t.index ["user_id"], name: "django_admin_log_user_id_c564eba6"
    t.check_constraint "action_flag >= 0", name: "django_admin_log_action_flag_check"
  end

  create_table "django_content_type", id: :serial, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_model_76bd3d3b_uniq", unique: true
  end

  create_table "django_migrations", id: :serial, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.timestamptz "applied", null: false
  end

  create_table "django_session", primary_key: "session_key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.text "session_data", null: false
    t.timestamptz "expire_date", null: false
    t.index ["expire_date"], name: "django_session_expire_date_a5c62663"
    t.index ["session_key"], name: "django_session_session_key_c0390e0f_like", opclass: :varchar_pattern_ops
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_customusers", id: :serial, force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.timestamptz "last_login"
    t.boolean "is_superuser", null: false
    t.string "username", limit: 150, null: false
    t.string "first_name", limit: 150, null: false
    t.string "last_name", limit: 150, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.timestamptz "date_joined", null: false
    t.index ["username"], name: "users_customusers_username_65b0f6dd_like", opclass: :varchar_pattern_ops
    t.index ["username"], name: "users_customusers_username_key", unique: true
  end

  create_table "users_customusers_groups", id: :serial, force: :cascade do |t|
    t.integer "customusers_id", null: false
    t.integer "group_id", null: false
    t.index ["customusers_id", "group_id"], name: "users_customusers_groups_customusers_id_group_id_1ff6d1e7_uniq", unique: true
    t.index ["customusers_id"], name: "users_customusers_groups_customusers_id_d94dc686"
    t.index ["group_id"], name: "users_customusers_groups_group_id_c76517e2"
  end

  create_table "users_customusers_user_permissions", id: :serial, force: :cascade do |t|
    t.integer "customusers_id", null: false
    t.integer "permission_id", null: false
    t.index ["customusers_id", "permission_id"], name: "users_customusers_user_p_customusers_id_permissio_0f978bfb_uniq", unique: true
    t.index ["customusers_id"], name: "users_customusers_user_permissions_customusers_id_efe6e859"
    t.index ["permission_id"], name: "users_customusers_user_permissions_permission_id_8da206a2"
  end

  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm", deferrable: :deferred
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permission_content_type_id_2f476e4b_fk_django_co", deferrable: :deferred
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_c4bce8eb_fk_django_co", deferrable: :deferred
  add_foreign_key "django_admin_log", "users_customusers", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_users_customusers_id", deferrable: :deferred
  add_foreign_key "users_customusers_groups", "auth_group", column: "group_id", name: "users_customusers_groups_group_id_c76517e2_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "users_customusers_groups", "users_customusers", column: "customusers_id", name: "users_customusers_gr_customusers_id_d94dc686_fk_users_cus", deferrable: :deferred
  add_foreign_key "users_customusers_user_permissions", "auth_permission", column: "permission_id", name: "users_customusers_us_permission_id_8da206a2_fk_auth_perm", deferrable: :deferred
  add_foreign_key "users_customusers_user_permissions", "users_customusers", column: "customusers_id", name: "users_customusers_us_customusers_id_efe6e859_fk_users_cus", deferrable: :deferred
end
