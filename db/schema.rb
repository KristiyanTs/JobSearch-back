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

ActiveRecord::Schema.define(version: 2019_09_01_141634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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

  create_table "assignees", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_assignees_on_node_id"
    t.index ["user_id"], name: "index_assignees_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "color"
    t.string "icon"
    t.string "icon_color"
    t.bigint "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_categories_on_node_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "node_id"
    t.text "content"
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_comments_on_ancestry"
    t.index ["node_id"], name: "index_comments_on_node_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_favorites_on_node_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "node_id"
    t.bigint "role_id"
    t.string "email", null: false
    t.boolean "rejected", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_invitations_on_node_id"
    t.index ["role_id"], name: "index_invitations_on_role_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "jwt_blacklist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_blacklist_on_jti"
  end

  create_table "logs", force: :cascade do |t|
    t.text "content"
    t.date "day"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "node_id"
    t.bigint "role_id"
    t.boolean "accepted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_memberships_on_node_id"
    t.index ["role_id"], name: "index_memberships_on_role_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "title"
    t.string "short_description"
    t.text "description"
    t.integer "priority"
    t.integer "effort"
    t.integer "impact"
    t.datetime "deadline"
    t.string "ancestry"
    t.bigint "reporter_id"
    t.bigint "status_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_nodes_on_ancestry"
    t.index ["category_id"], name: "index_nodes_on_category_id"
    t.index ["reporter_id"], name: "index_nodes_on_reporter_id"
    t.index ["status_id"], name: "index_nodes_on_status_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "instance"
    t.string "ability"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_roles_on_node_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "title"
    t.string "color"
    t.string "description"
    t.integer "order"
    t.bigint "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_statuses_on_node_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.integer "status", default: 0
    t.integer "position"
    t.date "day"
    t.datetime "times", default: [], array: true
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "admin", default: false, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assignees", "nodes"
  add_foreign_key "assignees", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "invitations", "nodes"
  add_foreign_key "invitations", "roles"
  add_foreign_key "invitations", "users"
  add_foreign_key "logs", "users"
  add_foreign_key "memberships", "nodes"
  add_foreign_key "memberships", "roles"
  add_foreign_key "memberships", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "permissions", "roles"
  add_foreign_key "roles", "nodes"
  add_foreign_key "tasks", "users"
end
