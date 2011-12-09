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

ActiveRecord::Schema.define(:version => 20111208001125) do

  create_table "ratings", :force => true do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "workout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "fb_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "followed_users"
  end

  create_table "workout_tags", :force => true do |t|
    t.string   "category"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "workout_id"
  end

  create_table "workouts", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "flagged"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "gmaps"
    t.string   "city"
    t.integer  "zipcode"
    t.integer  "difficulty"
    t.boolean  "sponsored"
    t.string   "fitness_tags"
    t.string   "obstacle"
    t.string   "MH_suggests"
    t.string   "editor_comments"
    t.string   "photo_label"
    t.integer  "created_by_id"
    t.integer  "average_rating"
  end

end
