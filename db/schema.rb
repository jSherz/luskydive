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

ActiveRecord::Schema.define(version: 20140811182057) do

  create_table "committee_members", force: true do |t|
    t.string   "name"
    t.string   "role"
    t.integer  "weighting"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faq_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faqs", force: true do |t|
    t.string   "question"
    t.text     "answer"
    t.integer  "weighting"
    t.integer  "faq_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "packages", force: true do |t|
    t.string   "title",        limit: 120
    t.text     "description"
    t.decimal  "price",                    precision: 5, scale: 2
    t.boolean  "active"
    t.integer  "weighting"
    t.string   "requirements"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
