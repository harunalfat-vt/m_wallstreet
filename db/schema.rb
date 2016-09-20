# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160920034155) do

  create_table "settings", force: :cascade do |t|
    t.string   "mid",          limit: 255, null: false
    t.string   "payment_type", limit: 255, null: false
    t.string   "provider",     limit: 255, null: false
    t.string   "payout_type",  limit: 255, null: false
    t.string   "begin_date",   limit: 255, null: false
    t.string   "end_date",     limit: 255, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "settings", ["mid", "payment_type", "provider"], name: "index_settings_on_mid_and_payment_type_and_provider", unique: true, using: :btree

end
