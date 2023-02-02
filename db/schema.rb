# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_02_005512) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "campaign_id", null: false
    t.uuid "donor_id", null: false
    t.decimal "amount", precision: 9, scale: 2
    t.boolean "match", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_donations_on_campaign_id"
    t.index ["donor_id"], name: "index_donations_on_donor_id"
  end

  create_table "donors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "kind", default: 0
    t.decimal "amount", precision: 9, scale: 2
    t.decimal "remaining_balance", precision: 9, scale: 2
    t.uuid "campaign_id", null: false
    t.uuid "donor_id", null: false
    t.integer "state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_matches_on_campaign_id"
    t.index ["donor_id"], name: "index_matches_on_donor_id"
    t.index ["kind"], name: "index_matches_on_kind"
    t.index ["state"], name: "index_matches_on_state"
  end

  add_foreign_key "donations", "campaigns"
  add_foreign_key "donations", "donors"
  add_foreign_key "matches", "campaigns"
  add_foreign_key "matches", "donors"
end
