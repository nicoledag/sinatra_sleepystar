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

ActiveRecord::Schema.define(version: 20190312032437) do

  create_table "babies", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planners", force: :cascade do |t|
    t.string   "wake_time"
    t.string   "bed_time"
    t.integer  "baby_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "notes"
    t.string   "morning_nap_start_time"
    t.string   "morning_nap_end_time"
    t.string   "midday_nap_start_time"
    t.string   "midday_nap_end_time"
    t.string   "late_afternoon_nap_start_time"
    t.string   "late_afternoon_nap_end_time"
    t.string   "morning_nap_total_time"
    t.string   "midday_nap_total_time"
    t.string   "late_afternoon_nap_total_time"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
  end

end
