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

ActiveRecord::Schema.define(:version => 20130522044555) do

  create_table "admin", :force => true do |t|
    t.string   "email",       :limit => 50,  :null => false
    t.string   "uname",       :limit => 100, :null => false
    t.string   "password",    :limit => 200, :null => false
    t.string   "description", :limit => 200
    t.datetime "regdate",                    :null => false
    t.string   "phone",       :limit => 20
    t.binary   "state",       :limit => 1
  end

  create_table "agents", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "province_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "article", :force => true do |t|
    t.string   "title",       :limit => 50,       :null => false
    t.text     "content",     :limit => 16777215, :null => false
    t.datetime "pulishdate",                      :null => false
    t.integer  "ty_id",                           :null => false
    t.integer  "recommended"
    t.datetime "reco_date"
    t.integer  "state",                           :null => false
  end

  add_index "article", ["ty_id"], :name => "type"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contactmethod", :force => true do |t|
    t.integer "uid",                   :null => false
    t.string  "method",  :limit => 20, :null => false
    t.string  "content", :limit => 50, :null => false
    t.binary  "state",   :limit => 1
  end

  add_index "contactmethod", ["uid"], :name => "userid"

  create_table "indexset", :force => true do |t|
    t.string   "module",  :limit => 20,  :null => false
    t.string   "title",   :limit => 50
    t.string   "picture", :limit => 200
    t.string   "url",     :limit => 100
    t.datetime "date",                   :null => false
  end

  create_table "member", :force => true do |t|
    t.string   "email",       :limit => 50,       :null => false
    t.string   "uname",       :limit => 100,      :null => false
    t.string   "password",    :limit => 200,      :null => false
    t.text     "description", :limit => 16777215
    t.datetime "regdate",                         :null => false
    t.integer  "utype",                           :null => false
    t.integer  "logincount"
    t.datetime "lastlogin"
    t.binary   "state",       :limit => 1,        :null => false
  end

  add_index "member", ["utype"], :name => "usertype"

  create_table "product", :force => true do |t|
    t.string   "prodname",    :limit => 100,      :null => false
    t.string   "picture",     :limit => 200
    t.text     "description", :limit => 16777215
    t.datetime "date",                            :null => false
    t.integer  "category_id"
  end

  create_table "provinces", :force => true do |t|
    t.string   "cha"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
  end

  create_table "systemtype", :force => true do |t|
    t.string  "typename",    :limit => 20,  :null => false
    t.integer "fatherid"
    t.binary  "systype",     :limit => 1
    t.string  "description", :limit => 100
  end

  add_index "systemtype", ["fatherid"], :name => "fid"

  create_table "upicture", :force => true do |t|
    t.integer "uid",                        :null => false
    t.string  "address",     :limit => 200, :null => false
    t.string  "description", :limit => 500
    t.binary  "state",       :limit => 1,   :null => false
  end

  add_index "upicture", ["uid"], :name => "uid"

  create_table "weblink", :force => true do |t|
    t.string "web_name", :limit => 20,  :null => false
    t.string "url",      :limit => 100, :null => false
    t.binary "state",    :limit => 1,   :null => false
  end

end
