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

ActiveRecord::Schema.define(version: 20131103211447) do

  create_table "attendancs", force: true do |t|
    t.integer  "employee_id"
    t.datetime "signin_time"
    t.datetime "signout_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendancs", ["employee_id"], name: "index_attendancs_on_employee_id", using: :btree

  create_table "employees", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "employees", ["email"], name: "index_employees_on_email", unique: true, using: :btree
  add_index "employees", ["remember_token"], name: "index_employees_on_remember_token", using: :btree

  create_table "events", force: true do |t|
    t.integer  "employee_id"
    t.string   "event_name"
    t.datetime "start_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["employee_id"], name: "index_events_on_employee_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
