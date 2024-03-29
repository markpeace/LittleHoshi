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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121202132037) do

  create_table "activities", :force => true do |t|
    t.integer  "box_id"
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "boxes", :force => true do |t|
    t.string    "theme"
    t.text      "notes"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "ingredientisations", :force => true do |t|
    t.integer  "activity_id"
    t.integer  "ingredient_id"
    t.integer  "quantity"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.decimal  "unitcost",   :precision => 4, :scale => 2
    t.integer  "stock",                                    :default => 0
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  create_table "invitations", :force => true do |t|
    t.string    "token"
    t.integer   "uses",       :default => 1
    t.string    "notes"
    t.timestamp "created_at",                :null => false
    t.timestamp "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "email"
    t.string    "hashed_password"
    t.boolean   "is_admin"
    t.boolean   "registration_of_interest", :default => false
    t.timestamp "created_at",                                  :null => false
    t.timestamp "updated_at",                                  :null => false
  end

end
