# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_23_225446) do

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.string "body"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "matching_posts", force: :cascade do |t|
    t.string "title", null: false
    t.string "body"
    t.integer "user_id"
    t.integer "article_id"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_matching_posts_on_article_id"
    t.index ["user_id"], name: "index_matching_posts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "matching_post_id"
    t.integer "user_id"
    t.integer "followed_user_id"
    t.integer "user_post_id"
    t.integer "followed_post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_user_id"], name: "index_relationships_on_followed_user_id"
    t.index ["user_id", "followed_user_id"], name: "index_relationships_on_user_id_and_followed_user_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "time_frames", force: :cascade do |t|
    t.datetime "time_frame"
    t.integer "user_id"
    t.integer "matching_post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["matching_post_id"], name: "index_time_frames_on_matching_post_id"
    t.index ["user_id"], name: "index_time_frames_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "articles", "users"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "followed_user_id"
end
