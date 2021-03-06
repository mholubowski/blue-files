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

ActiveRecord::Schema.define(:version => 20130210050932) do

  create_table "accounts", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "password_confirmation"
    t.string   "remember_token"
    t.integer  "accept_terms_and_conditions"
    t.string   "category"
    t.string   "sub_category"
    t.string   "sub_sub_category"
    t.string   "account_admin_password"
    t.string   "schedule_type"
    t.string   "admin_email"
    t.string   "admin_phone"
    t.string   "admin_name"
    t.integer  "total_views"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "accounts", ["remember_token"], :name => "index_accounts_on_remember_token"

  create_table "document_comments", :force => true do |t|
    t.string   "content"
    t.integer  "document_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "documents", :force => true do |t|
    t.integer  "account_id"
    t.integer  "number_of_pages"
    t.string   "category"
    t.string   "sub_category"
    t.string   "sub_sub_category"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "title"
    t.string   "type_of_document"
    t.string   "document_file"
    t.string   "hidden"
    t.boolean  "confirmed"
    t.string   "original_comment"
    t.integer  "views"
    t.integer  "comment_count"
    t.string   "quarter"
  end

  create_table "requests", :force => true do |t|
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "account_id"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "account_id"
    t.string   "stripe_card_token"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "plan"
    t.string   "stripe_customer_token"
    t.string   "email"
    t.string   "description"
    t.datetime "trial_expiration_date"
  end

end
