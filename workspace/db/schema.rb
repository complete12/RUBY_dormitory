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

ActiveRecord::Schema.define(version: 20150921102428) do

  create_table "communities", force: :cascade do |t|
    t.string   "com_category"
    t.string   "com_title"
    t.text     "com_content"
    t.string   "com_writer"
    t.integer  "com_hits"
    t.integer  "com_studentID"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "croomdbs", force: :cascade do |t|
    t.integer  "domitory_id"
    t.integer  "student_number"
    t.date     "apply_date"
    t.integer  "apply",          default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "domitories", force: :cascade do |t|
    t.string   "email",                               null: false
    t.string   "encrypted_password",                  null: false
    t.string   "name"
    t.integer  "student_number"
    t.string   "major"
    t.string   "user_phone_number"
    t.string   "parent_phone_number"
    t.string   "room_number"
    t.integer  "sleepout_rest",          default: 12
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "domitories", ["email"], name: "index_domitories_on_email", unique: true
  add_index "domitories", ["reset_password_token"], name: "index_domitories_on_reset_password_token", unique: true

  create_table "notices", force: :cascade do |t|
    t.string   "notice_title"
    t.text     "notice_content"
    t.integer  "notice_hits"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "p_category"
    t.string   "p_answer"
    t.string   "p_title"
    t.text     "p_content"
    t.integer  "p_studentID"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "community_id"
    t.text     "r_content"
    t.integer  "r_studentID"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "reply_proposals", force: :cascade do |t|
    t.integer  "proposal_id"
    t.text     "answer_content"
    t.integer  "answer_studentID"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "sleepoutdbs", force: :cascade do |t|
    t.integer  "domitory_id"
    t.integer  "student_number"
    t.date     "apply_start_date"
    t.date     "apply_end_date"
    t.integer  "apply"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
