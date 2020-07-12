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

ActiveRecord::Schema.define(version: 2020_07_11_194744) do

  create_table "brands", force: :cascade do |t|
    t.string "company_name"
  end

  create_table "shoes", force: :cascade do |t|
    t.string "name"
    t.integer "retail_price"
    t.integer "resale_price"
    t.integer "quality"
    t.integer "user_id"
    t.integer "brand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "uid"
  end

end
