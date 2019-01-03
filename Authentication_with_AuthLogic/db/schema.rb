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

ActiveRecord::Schema.define(version: 20150720125539) do

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "persistence_token"
    t.integer  "login_count",        default: 0, null: false
    t.integer  "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "perishable_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
