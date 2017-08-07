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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170805074218) do
=======
ActiveRecord::Schema.define(version: 20170805070107) do
>>>>>>> c2b75dee7e9e684f5ead1c25b76ae5e53f963b02

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budget_trips", force: :cascade do |t|
    t.bigint "schedule_detail_id"
    t.bigint "trip_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_detail_id"], name: "index_budget_trips_on_schedule_detail_id"
    t.index ["trip_id"], name: "index_budget_trips_on_trip_id"
  end

  create_table "budgets", force: :cascade do |t|
    t.bigint "budget_trip_id"
    t.integer "price"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trip_id"
    t.index ["budget_trip_id"], name: "index_budgets_on_budget_trip_id"
    t.index ["trip_id"], name: "index_budgets_on_trip_id"
  end

  create_table "invite_tokens", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "trip_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_invite_tokens_on_trip_id"
    t.index ["user_id"], name: "index_invite_tokens_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "place_id"
    t.string "photo_reference"
    t.integer "height"
    t.integer "width"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trip_id"
    t.string "image"
    t.index ["place_id"], name: "index_photos_on_place_id"
    t.index ["trip_id"], name: "index_photos_on_trip_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "location_id"
    t.decimal "rating"
    t.decimal "latitude"
    t.decimal "longitude"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_places_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rpush_apps", force: :cascade do |t|
    t.string "name", null: false
    t.string "environment"
    t.text "certificate"
    t.string "password"
    t.integer "connections", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", null: false
    t.string "auth_key"
    t.string "client_id"
    t.string "client_secret"
    t.string "access_token"
    t.datetime "access_token_expiration"
  end

  create_table "rpush_feedback", force: :cascade do |t|
    t.string "device_token", limit: 64, null: false
    t.datetime "failed_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "app_id"
    t.index ["device_token"], name: "index_rpush_feedback_on_device_token"
  end

  create_table "rpush_notifications", force: :cascade do |t|
    t.integer "badge"
    t.string "device_token", limit: 64
    t.string "sound", default: "default"
    t.text "alert"
    t.text "data"
    t.integer "expiry", default: 86400
    t.boolean "delivered", default: false, null: false
    t.datetime "delivered_at"
    t.boolean "failed", default: false, null: false
    t.datetime "failed_at"
    t.integer "error_code"
    t.text "error_description"
    t.datetime "deliver_after"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "alert_is_json", default: false
    t.string "type", null: false
    t.string "collapse_key"
    t.boolean "delay_while_idle", default: false, null: false
    t.text "registration_ids"
    t.integer "app_id", null: false
    t.integer "retries", default: 0
    t.string "uri"
    t.datetime "fail_after"
    t.boolean "processing", default: false, null: false
    t.integer "priority"
    t.text "url_args"
    t.string "category"
    t.boolean "content_available", default: false
    t.text "notification"
    t.index ["delivered", "failed"], name: "index_rpush_notifications_multi", where: "((NOT delivered) AND (NOT failed))"
  end

  create_table "schedule_details", force: :cascade do |t|
    t.bigint "schedule_id"
    t.bigint "place_id"
    t.integer "index"
    t.decimal "hour_spend", default: "1.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "distance"
    t.string "duration"
    t.string "tempday"
    t.string "tempeve"
    t.string "tempnight"
    t.string "tempmain"
    t.string "tempdesc"
    t.index ["index"], name: "index_schedule_details_on_index"
    t.index ["place_id"], name: "index_schedule_details_on_place_id"
    t.index ["schedule_id"], name: "index_schedule_details_on_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "title"
    t.integer "index"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["index"], name: "index_schedules_on_index"
    t.index ["trip_id"], name: "index_schedules_on_trip_id"
  end

  create_table "to_dos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "start_date"
    t.integer "departure_id"
    t.string "title"
    t.text "description"
    t.decimal "expected_budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photos"
    t.string "video_link"
    t.string "visible_scope"
    t.integer "user_trips_count", default: 0
    t.index ["departure_id"], name: "index_trips_on_departure_id"
  end

  create_table "user_notifications", force: :cascade do |t|
    t.bigint "notification_id"
    t.bigint "user_id"
    t.integer "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_id"], name: "index_user_notifications_on_notification_id"
    t.index ["user_id"], name: "index_user_notifications_on_user_id"
  end

  create_table "user_trips", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_user_trips_on_trip_id"
    t.index ["user_id"], name: "index_user_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.text "image"
    t.string "phone_number"
    t.string "facebook_avatar"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "budget_trips", "schedule_details"
  add_foreign_key "budget_trips", "trips"
  add_foreign_key "budgets", "budget_trips"
  add_foreign_key "budgets", "trips"
  add_foreign_key "invite_tokens", "trips"
  add_foreign_key "invite_tokens", "users"
  add_foreign_key "photos", "trips"
  add_foreign_key "schedule_details", "places"
  add_foreign_key "schedule_details", "schedules"
  add_foreign_key "schedules", "trips"
  add_foreign_key "user_notifications", "notifications"
  add_foreign_key "user_notifications", "users"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "users"
end
