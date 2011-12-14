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

ActiveRecord::Schema.define(:version => 20111213043327) do

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
    t.text     "followed_users"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.boolean  "fit_agility"
    t.boolean  "fit_arms_and_back"
    t.boolean  "fit_balance"
    t.boolean  "fit_cardio"
    t.boolean  "fit_core"
    t.boolean  "fit_endurance"
    t.boolean  "fit_lower_body"
    t.boolean  "fit_relaxation"
    t.boolean  "fit_speed"
    t.boolean  "fit_stability"
    t.boolean  "fit_stretch"
    t.boolean  "fit_stretching"
    t.boolean  "fit_total_body"
    t.boolean  "fit_upper_body"
    t.boolean  "fit_whole_body"
    t.boolean  "obstac_balance_beam"
    t.boolean  "obstac_ball_fields"
    t.boolean  "obstac_barricade"
    t.boolean  "obstac_bars"
    t.boolean  "obstac_beach"
    t.boolean  "obstac_bench"
    t.boolean  "obstac_bike_rack"
    t.boolean  "obstac_concrete_ledge"
    t.boolean  "obstac_court"
    t.boolean  "obstac_field"
    t.boolean  "obstac_fountain_edge"
    t.boolean  "obstac_grass_field"
    t.boolean  "obstac_hill"
    t.boolean  "obstac_hurdles"
    t.boolean  "obstac_outdoor_gym"
    t.boolean  "obstac_park"
    t.boolean  "obstac_picnic_benches"
    t.boolean  "obstac_playground"
    t.boolean  "obstac_pullup_bar"
    t.boolean  "obstac_sand_dunes"
    t.boolean  "obstac_stadium_steps"
    t.boolean  "obstac_stairs"
    t.boolean  "obstac_track"
    t.boolean  "obstac_trail"
    t.boolean  "user_created"
    t.float    "average_rating"
  end

end
