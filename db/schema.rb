# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110321074636) do

  create_table "accounts", :force => true do |t|
    t.string   "first_name",     :limit => 25,  :null => false
    t.string   "last_name",      :limit => 25,  :null => false
    t.string   "email",          :limit => 100, :null => false
    t.string   "password",       :limit => 50,  :null => false
    t.string   "company",        :limit => 50
    t.string   "phone",          :limit => 14
    t.string   "billing_street", :limit => 50
    t.string   "billing_city",   :limit => 50
    t.string   "billing_state",  :limit => 2
    t.string   "billing_zip",    :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activities", :force => true do |t|
    t.integer  "user_id",         :null => false
    t.integer  "collection_id"
    t.string   "action_taken",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",      :null => false
    t.string   "user_name",       :null => false
    t.string   "collection_name"
  end

  create_table "collections", :force => true do |t|
    t.string   "name",       :limit => 50, :null => false
    t.integer  "user_id",                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",               :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "mpn"
    t.decimal  "price",                      :precision => 8, :scale => 2, :default => 0.0,   :null => false
    t.string   "upc"
    t.string   "seller"
    t.string   "condition"
    t.string   "ean"
    t.string   "model_number"
    t.string   "brand"
    t.string   "product_type"
    t.string   "url"
    t.string   "image_url"
    t.string   "country"
    t.date     "expiration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "collection_id"
    t.string   "currency",      :limit => 3,                               :default => "usd", :null => false
  end

  create_table "searches", :force => true do |t|
    t.string   "query",      :limit => 200, :null => false
    t.integer  "user_id",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
