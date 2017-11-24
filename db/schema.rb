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

ActiveRecord::Schema.define(version: 0) do

  create_table "investment_data", force: :cascade do |t|
    t.integer "investor_id", limit: 6, precision: 6, null: false
    t.integer "investment_id", limit: 6, precision: 6, null: false
    t.date "investment_date", null: false
    t.integer "invest_amount", limit: 9, precision: 9
  end

  create_table "investment_data_copy", force: :cascade do |t|
    t.integer "investor_id", limit: 6, precision: 6, null: false
    t.integer "investment_id", limit: 6, precision: 6, null: false
    t.date "investment_date", null: false
    t.integer "invest_amount", limit: 9, precision: 9
  end

  create_table "investments", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.integer "worth", limit: 9, precision: 9, null: false
    t.string "address", limit: 50, null: false
    t.string "city", limit: 30, null: false
    t.string "country", limit: 30, null: false
    t.integer "min_invest_amount", limit: 9, precision: 9, null: false
    t.integer "max_invest_amount", limit: 6, precision: 6, null: false
    t.integer "max_total_invest_amount", limit: 9, precision: 9, null: false
    t.boolean "marked", default: false, null: false
  end

  create_table "investors", force: :cascade do |t|
    t.string "first_name", limit: 20, null: false
    t.string "last_name", limit: 20, null: false
    t.string "email", limit: 50, null: false
    t.string "city", limit: 20, null: false
  end

  add_foreign_key "investment_data", "investments", name: "fk_investment"
  add_foreign_key "investment_data", "investors", name: "fk_investor"
end
