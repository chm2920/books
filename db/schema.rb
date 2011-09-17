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

ActiveRecord::Schema.define(:version => 20110916151559) do

  create_table "addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "city"
    t.string   "street"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", :force => true do |t|
    t.string   "adminname"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attrs", :force => true do |t|
    t.string "name"
  end

  create_table "authors", :force => true do |t|
    t.string "name"
    t.text   "intro"
  end

  create_table "cart_items", :force => true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.integer "node_id"
    t.string  "name"
    t.string  "summary"
  end

  create_table "doubans", :force => true do |t|
    t.integer "dou_id"
    t.string  "title"
    t.string  "img"
    t.text    "summary"
    t.string  "author"
    t.string  "tag"
    t.text    "gets"
    t.string  "rating"
    t.string  "numRaters"
    t.integer "is_in",     :default => 0
  end

  create_table "flashpics", :force => true do |t|
    t.string "title"
    t.string "image_file_name"
    t.string "url"
  end

  create_table "kindeditor_images", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_categories", :force => true do |t|
    t.string "name"
  end

  create_table "news_topics", :force => true do |t|
    t.integer  "news_category_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", :force => true do |t|
    t.string "name"
    t.string "alias"
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "address_id"
    t.integer  "total_price"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_attrs", :force => true do |t|
    t.integer "product_id"
    t.integer "attr_id"
    t.string  "val"
  end

  create_table "product_props", :force => true do |t|
    t.integer "property_category_id"
    t.integer "property_id"
    t.integer "product_id"
    t.string  "val"
  end

  create_table "products", :force => true do |t|
    t.integer  "node_id"
    t.integer  "category_id"
    t.string   "title"
    t.string   "image_file_name"
    t.string   "sale_price"
    t.string   "price"
    t.text     "summary"
    t.integer  "num",             :default => 1, :null => false
    t.integer  "hits",            :default => 0, :null => false
    t.integer  "is_pub",          :default => 0, :null => false
    t.integer  "sold",            :default => 0, :null => false
    t.integer  "is_trash",        :default => 0, :null => false
    t.integer  "dou_id"
    t.integer  "rating"
    t.integer  "numRaters"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_authors", :force => true do |t|
    t.integer "product_id"
    t.integer "author_id"
  end

  create_table "products_tags", :force => true do |t|
    t.integer "product_id"
    t.integer "tag_id"
  end

  create_table "properties", :force => true do |t|
    t.integer "property_category_id"
    t.string  "name"
  end

  create_table "property_categories", :force => true do |t|
    t.string "name"
  end

  create_table "publishers", :force => true do |t|
    t.string "name"
    t.text   "intro"
  end

  create_table "run_logs", :force => true do |t|
    t.string   "log_path"
    t.string   "log_method"
    t.string   "log_params"
    t.string   "log_exception"
    t.string   "log_remote_ip"
    t.datetime "created_at"
  end

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.integer  "login_times",      :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
