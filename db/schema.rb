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

ActiveRecord::Schema.define(version: 20140612172219) do

  create_table "battles", force: true do |t|
    t.integer  "match_id"
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "result"
    t.integer  "player1_total_point"
    t.integer  "player2_total_point"
  end

  create_table "bets", force: true do |t|
    t.integer  "match_id"
    t.integer  "team1_score"
    t.integer  "team2_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
    t.integer  "calculation_id"
    t.integer  "result"
    t.boolean  "own_goal"
    t.boolean  "yellow_card"
    t.boolean  "red_card"
    t.boolean  "penalty"
    t.integer  "calculation_config_id"
  end

  create_table "calculation_configs", force: true do |t|
    t.integer  "team_winner_multiply"
    t.integer  "score_multiply"
    t.integer  "penalty_multiply"
    t.integer  "yellow_card_multiply"
    t.integer  "red_card_multiply"
    t.integer  "own_goal_multiply"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bonus_team_multiply"
  end

  create_table "calculations", force: true do |t|
    t.integer  "player_id"
    t.integer  "bet_id"
    t.integer  "total_point"
    t.integer  "team_winner_point"
    t.integer  "score_point"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bonus_team_point"
    t.integer  "own_goal_point"
    t.integer  "yellow_card_point"
    t.integer  "red_card_point"
    t.integer  "penalty_point"
  end

  create_table "matches", force: true do |t|
    t.datetime "match"
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.integer  "team1_score"
    t.integer  "team2_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "closed"
    t.string   "description"
    t.string   "live"
    t.integer  "result"
    t.boolean  "own_goal"
    t.boolean  "yellow_card"
    t.boolean  "red_card"
    t.boolean  "penalty"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.boolean  "admin"
    t.integer  "user_id"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "abbreviate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
    t.string   "link"
  end

end
