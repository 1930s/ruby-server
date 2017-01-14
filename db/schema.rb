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

ActiveRecord::Schema.define(version: 20170114174905) do

  create_table "items", primary_key: "uuid", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",      limit: 65535
    t.string   "content_type"
    t.string   "enc_item_key"
    t.string   "auth_hash"
    t.string   "user_uuid"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "deleted",                    default: false
    t.index ["updated_at"], name: "index_items_on_updated_at", using: :btree
  end

  create_table "users", primary_key: "uuid", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "encrypted_password", default: "", null: false
    t.string   "pw_func"
    t.string   "pw_alg"
    t.integer  "pw_cost"
    t.integer  "pw_key_size"
    t.string   "pw_nonce"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

end
