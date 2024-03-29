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

ActiveRecord::Schema.define(:version => 20111026134831) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hints", :force => true do |t|
    t.text     "hint"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pick_a_point_sequence_id"
    t.integer  "position"
  end

  add_index "hints", ["pick_a_point_sequence_id"], :name => "index_hints_on_pick_a_point_sequence_id"

  create_table "image_panes", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "attribution"
  end

  create_table "instruction_sequences", :force => true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_panes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
    t.integer  "pane_id"
    t.string   "pane_type"
    t.integer  "position"
  end

  add_index "page_panes", ["page_id"], :name => "index_page_panes_on_page_id"
  add_index "page_panes", ["pane_type", "pane_id"], :name => "index_page_panes_on_pane_type_and_pane_id"

  create_table "page_sequences", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
    t.integer  "sequence_id"
    t.string   "sequence_type"
  end

  add_index "page_sequences", ["page_id"], :name => "index_page_sequences_on_page_id"
  add_index "page_sequences", ["sequence_type", "sequence_id"], :name => "index_page_sequences_on_sequence_type_and_sequence_id"

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_id"
    t.integer  "position"
    t.text     "text"
  end

  add_index "pages", ["activity_id"], :name => "index_pages_on_activity_id"

  create_table "pick_a_point_sequences", :force => true do |t|
    t.text     "initial_prompt"
    t.string   "correct_condition"
    t.text     "give_up_prompt"
    t.text     "correct_prompt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "predefined_graph_panes", :force => true do |t|
    t.string   "title"
    t.string   "y_label"
    t.float    "y_min"
    t.float    "y_max"
    t.float    "y_ticks"
    t.string   "x_label"
    t.float    "x_min"
    t.float    "x_max"
    t.float    "x_ticks"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "table_panes", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "inactive"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
