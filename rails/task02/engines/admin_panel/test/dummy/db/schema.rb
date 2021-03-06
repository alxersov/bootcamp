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

ActiveRecord::Schema.define(:version => 20180608104505) do

  create_table "admin_panel_featured_products", :force => true do |t|
    t.string   "title"
    t.decimal  "price",      :precision => 8, :scale => 2
    t.string   "image"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "admin_panel_inspirations", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "admin_panel_shippings", :force => true do |t|
    t.string   "title"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "admin_panel_sliders", :force => true do |t|
    t.string   "title"
    t.string   "catption"
    t.string   "banner"
    t.string   "button_url"
    t.string   "button_text"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
