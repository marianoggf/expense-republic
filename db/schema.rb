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

ActiveRecord::Schema.define(version: 2021_08_29_152854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "debts", force: :cascade do |t|
    t.boolean "paid", default: false
    t.decimal "total"
    t.bigint "expense_id", null: false
    t.bigint "tenant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_id"], name: "index_debts_on_expense_id"
    t.index ["tenant_id"], name: "index_debts_on_tenant_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.datetime "date"
    t.boolean "balanced"
    t.decimal "total"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.decimal "percent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "debts", "expenses"
  add_foreign_key "debts", "tenants"
end
