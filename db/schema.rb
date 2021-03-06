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

ActiveRecord::Schema.define(version: 20160728200131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "subdomain"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "subject",            default: "", null: false
    t.string   "from_email",         default: "", null: false
    t.string   "from_name",          default: "", null: false
    t.string   "reply_to",           default: "", null: false
    t.integer  "status",             default: 0,  null: false
    t.string   "send_report_to"
    t.datetime "scheduled_on"
    t.datetime "sending_started_on"
    t.datetime "sent_on"
    t.datetime "retry_started_on"
    t.integer  "client_id"
    t.index ["client_id"], name: "index_campaigns_on_client_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "contact_name",  default: "", null: false
    t.string   "contact_email", default: "", null: false
    t.string   "country_code",  default: "", null: false
    t.integer  "time_zone",     default: -5, null: false
  end

  create_table "mail_contents", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "campaign_id"
    t.text     "html_content", default: "", null: false
    t.text     "text_content", default: "", null: false
    t.index ["campaign_id"], name: "index_campaign_id", using: :btree
  end

  create_table "recipients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "comments"
    t.integer  "click_count"
    t.datetime "click_on"
    t.text     "dsn"
    t.integer  "open_count"
    t.datetime "open_on"
    t.datetime "sent_on"
    t.datetime "bounce_on"
    t.boolean  "was_clicked"
    t.boolean  "was_opened"
    t.boolean  "was_sent"
    t.boolean  "was_failed"
    t.boolean  "was_parsed"
    t.datetime "parsed_on"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "campaign_id"
    t.index ["campaign_id"], name: "index_recipients_campaign_id", using: :btree
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "is_active"
    t.integer  "bounce_count"
    t.text     "bounce_comments"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "subscription_list_id"
    t.index ["subscription_list_id"], name: "index_subscribers_subscription_list_id", using: :btree
  end

  create_table "subscription_lists", force: :cascade do |t|
    t.string   "name"
    t.integer  "list_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "client_id"
    t.index ["client_id"], name: "index_subscription_list_client_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "campaigns", "clients"
end
