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

ActiveRecord::Schema[7.0].define(version: 2023_06_15_190355) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_accounts", force: :cascade do |t|
    t.string "full_name"
    t.integer "account_number"
    t.string "sort_code"
    t.bigint "user_id", null: false
    t.string "bank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "payments_tables", force: :cascade do |t|
    t.float "amount"
    t.bigint "request_id", null: false
    t.bigint "sender_account_id", null: false
    t.bigint "reciever_account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reciever_account_id"], name: "index_payments_tables_on_reciever_account_id"
    t.index ["request_id"], name: "index_payments_tables_on_request_id"
    t.index ["sender_account_id"], name: "index_payments_tables_on_sender_account_id"
  end

  create_table "pot_members", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pot_id", null: false
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_pot_members_on_request_id"
  end

  create_table "pots", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "total_amount"
    t.boolean "cleared"
    t.bigint "creator_id", null: false
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_pots_on_creator_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "message"
    t.float "amount"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.string "paypal"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bank_accounts", "users"
  add_foreign_key "payments_tables", "bank_accounts", column: "reciever_account_id"
  add_foreign_key "payments_tables", "bank_accounts", column: "sender_account_id"
  add_foreign_key "payments_tables", "requests"
  add_foreign_key "pot_members", "requests"
  add_foreign_key "pots", "users", column: "creator_id"
end
