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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160223142837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_categories", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.boolean  "display",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",                                   null: false
    t.text     "summary",                                 null: false
    t.text     "content",                                 null: false
    t.string   "image"
    t.string   "social_share_title"
    t.string   "social_share_image"
    t.string   "social_share_description"
    t.date     "date",                                    null: false
    t.string   "suggested_url"
    t.boolean  "display",                  default: true
    t.boolean  "home_page_highlight",      default: true
    t.string   "slug"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "article_category_id"
    t.integer  "team_member_id"
  end

  add_index "articles", ["article_category_id"], name: "index_articles_on_article_category_id", using: :btree
  add_index "articles", ["team_member_id"], name: "index_articles_on_team_member_id", using: :btree

  create_table "audiences", force: :cascade do |t|
    t.string   "title",                            null: false
    t.boolean  "display",           default: true
    t.integer  "position"
    t.integer  "departments_count"
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "awards", force: :cascade do |t|
    t.integer  "position"
    t.string   "title",                     null: false
    t.string   "image",                     null: false
    t.string   "link"
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "title",                             null: false
    t.text     "summary"
    t.string   "image"
    t.string   "social_share_image"
    t.boolean  "display",            default: true
    t.string   "suggested_url"
    t.string   "slug"
    t.integer  "audience_id"
    t.integer  "services_count"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "team_member_id"
  end

  add_index "departments", ["audience_id"], name: "index_departments_on_audience_id", using: :btree
  add_index "departments", ["team_member_id"], name: "index_departments_on_team_member_id", using: :btree

  create_table "download_categories", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.boolean  "display",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "downloads", force: :cascade do |t|
    t.string   "title",                               null: false
    t.text     "summary",                             null: false
    t.text     "description"
    t.string   "file",                                null: false
    t.string   "image"
    t.integer  "download_category_id"
    t.boolean  "display",              default: true
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "downloads", ["download_category_id"], name: "index_downloads_on_download_category_id", using: :btree

  create_table "event_categories", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.boolean  "display",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "event_categories", ["slug"], name: "index_event_categories_on_slug", unique: true, using: :btree
  add_index "event_categories", ["suggested_url"], name: "index_event_categories_on_suggested_url", unique: true, using: :btree

  create_table "event_locations", force: :cascade do |t|
    t.string   "building_name",  null: false
    t.string   "address_line_1", null: false
    t.string   "address_line_2"
    t.string   "city",           null: false
    t.string   "postcode",       null: false
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",                    limit: 150,                null: false
    t.text     "summary",                                             null: false
    t.text     "content"
    t.datetime "event_start",                                         null: false
    t.datetime "event_end",                                           null: false
    t.string   "booking_link"
    t.datetime "booking_deadline"
    t.string   "image"
    t.string   "social_share_title",       limit: 150
    t.string   "social_share_description"
    t.string   "social_share_image"
    t.string   "slug"
    t.string   "suggested_url"
    t.boolean  "display",                              default: true
    t.integer  "event_category_id"
    t.integer  "event_location_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "events", ["event_category_id"], name: "index_events_on_event_category_id", using: :btree
  add_index "events", ["event_location_id"], name: "index_events_on_event_location_id", using: :btree
  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  add_index "events", ["suggested_url"], name: "index_events_on_suggested_url", unique: true, using: :btree

  create_table "features", force: :cascade do |t|
    t.string   "key",                        null: false
    t.boolean  "enabled",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "frequently_asked_questions", force: :cascade do |t|
    t.string   "question",                  null: false
    t.text     "answer",                    null: false
    t.integer  "position"
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "office_locations", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string   "name"
    t.string   "building_name"
    t.string   "building_number"
    t.string   "street",                            null: false
    t.string   "town",                              null: false
    t.string   "county",                            null: false
    t.string   "postcode",                          null: false
    t.string   "phone_number"
    t.string   "fax_number"
    t.string   "email"
    t.string   "dx_number"
    t.text     "details"
    t.string   "image"
    t.integer  "office_location_id"
    t.boolean  "display",            default: true
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "offices", ["office_location_id"], name: "index_offices_on_office_location_id", using: :btree

  create_table "optimadmin_administrators", force: :cascade do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "role",                   null: false
    t.string   "auth_token"
    t.string   "password_digest",        null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "optimadmin_administrators", ["auth_token"], name: "index_optimadmin_administrators_on_auth_token", using: :btree
  add_index "optimadmin_administrators", ["email"], name: "index_optimadmin_administrators_on_email", using: :btree
  add_index "optimadmin_administrators", ["username"], name: "index_optimadmin_administrators_on_username", using: :btree

  create_table "optimadmin_documents", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "document",    null: false
    t.string   "module_name"
    t.integer  "module_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optimadmin_external_links", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optimadmin_images", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "image",       null: false
    t.string   "module_name"
    t.integer  "module_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optimadmin_links", force: :cascade do |t|
    t.string   "menu_resource_type"
    t.integer  "menu_resource_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "optimadmin_menu_item_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "optimadmin_menu_item_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "menu_item_anc_desc_idx", unique: true, using: :btree
  add_index "optimadmin_menu_item_hierarchies", ["descendant_id"], name: "menu_item_desc_idx", using: :btree

  create_table "optimadmin_menu_items", force: :cascade do |t|
    t.string   "menu_name",       limit: 100
    t.string   "name",            limit: 100
    t.integer  "parent_id"
    t.boolean  "deletable",                   default: true
    t.boolean  "new_window",                  default: false
    t.string   "title_attribute", limit: 100
    t.integer  "position",                    default: 0
    t.integer  "link_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "optimadmin_menu_items", ["link_id"], name: "index_optimadmin_menu_items_on_link_id", using: :btree

  create_table "optimadmin_module_pages", force: :cascade do |t|
    t.string   "name"
    t.string   "route"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optimadmin_site_settings", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.string "environment"
  end

  create_table "service_articles", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_articles", ["article_id"], name: "index_service_articles_on_article_id", using: :btree
  add_index "service_articles", ["service_id"], name: "index_service_articles_on_service_id", using: :btree

  create_table "service_downloads", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "download_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "service_downloads", ["download_id"], name: "index_service_downloads_on_download_id", using: :btree
  add_index "service_downloads", ["service_id"], name: "index_service_downloads_on_service_id", using: :btree

  create_table "service_events", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_events", ["event_id"], name: "index_service_events_on_event_id", using: :btree
  add_index "service_events", ["service_id"], name: "index_service_events_on_service_id", using: :btree

  create_table "service_faqs", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "frequently_asked_question_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "service_faqs", ["frequently_asked_question_id"], name: "index_service_faqs_on_frequently_asked_question_id", using: :btree
  add_index "service_faqs", ["service_id"], name: "index_service_faqs_on_service_id", using: :btree

  create_table "service_offices", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_offices", ["office_id"], name: "index_service_offices_on_office_id", using: :btree
  add_index "service_offices", ["service_id"], name: "index_service_offices_on_service_id", using: :btree

  create_table "service_related_services", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "related_service_id"
    t.integer  "position"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "service_related_services", ["related_service_id"], name: "index_service_related_services_on_related_service_id", using: :btree
  add_index "service_related_services", ["service_id"], name: "index_service_related_services_on_service_id", using: :btree

  create_table "service_team_members", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "team_member_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "service_team_members", ["service_id"], name: "index_service_team_members_on_service_id", using: :btree
  add_index "service_team_members", ["team_member_id"], name: "index_service_team_members_on_team_member_id", using: :btree

  create_table "service_testimonials", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "testimonial_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "service_testimonials", ["service_id"], name: "index_service_testimonials_on_service_id", using: :btree
  add_index "service_testimonials", ["testimonial_id"], name: "index_service_testimonials_on_testimonial_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.integer  "department_id"
    t.integer  "parent_id"
    t.string   "title",                    limit: 150,                null: false
    t.text     "summary",                                             null: false
    t.text     "content"
    t.string   "social_share_title"
    t.text     "social_share_description"
    t.string   "image"
    t.string   "social_share_image"
    t.string   "slug"
    t.string   "suggested_url"
    t.boolean  "display",                              default: true
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "services", ["department_id"], name: "index_services_on_department_id", using: :btree
  add_index "services", ["slug"], name: "index_services_on_slug", unique: true, using: :btree
  add_index "services", ["suggested_url"], name: "index_services_on_suggested_url", unique: true, using: :btree

  create_table "team_member_offices", force: :cascade do |t|
    t.integer  "team_member_id"
    t.integer  "office_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "team_member_offices", ["office_id"], name: "index_team_member_offices_on_office_id", using: :btree
  add_index "team_member_offices", ["team_member_id"], name: "index_team_member_offices_on_team_member_id", using: :btree

  create_table "team_member_roles", force: :cascade do |t|
    t.string   "title",                     null: false
    t.integer  "position"
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.integer  "position"
    t.string   "forename",                           null: false
    t.string   "surname",                            null: false
    t.string   "image"
    t.string   "primary_telephone"
    t.string   "secondary_telephone"
    t.string   "email_address"
    t.datetime "display_from"
    t.datetime "display_until"
    t.boolean  "display",             default: true
    t.text     "specialisms"
    t.boolean  "has_vcard_download"
    t.text     "profile"
    t.string   "google_plus"
    t.string   "twitter_link"
    t.string   "facebook_link"
    t.string   "mobile_number"
    t.string   "dx_number"
    t.string   "suggested_url"
    t.string   "slug"
    t.integer  "team_member_role_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "team_members", ["team_member_role_id"], name: "index_team_members_on_team_member_role_id", using: :btree

  create_table "testimonials", force: :cascade do |t|
    t.text     "content",                       null: false
    t.string   "author_name",                   null: false
    t.string   "author_company"
    t.string   "image"
    t.boolean  "display",        default: true
    t.integer  "position"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_foreign_key "articles", "article_categories"
  add_foreign_key "articles", "team_members"
  add_foreign_key "departments", "audiences"
  add_foreign_key "departments", "team_members"
  add_foreign_key "downloads", "download_categories"
  add_foreign_key "events", "event_categories"
  add_foreign_key "events", "event_locations"
  add_foreign_key "offices", "office_locations"
  add_foreign_key "service_articles", "articles"
  add_foreign_key "service_articles", "services"
  add_foreign_key "service_downloads", "downloads"
  add_foreign_key "service_downloads", "services"
  add_foreign_key "service_events", "events"
  add_foreign_key "service_events", "services"
  add_foreign_key "service_faqs", "frequently_asked_questions"
  add_foreign_key "service_faqs", "services"
  add_foreign_key "service_offices", "offices"
  add_foreign_key "service_offices", "services"
  add_foreign_key "service_related_services", "services"
  add_foreign_key "service_team_members", "services"
  add_foreign_key "service_team_members", "team_members"
  add_foreign_key "service_testimonials", "services"
  add_foreign_key "service_testimonials", "testimonials"
  add_foreign_key "services", "departments"
  add_foreign_key "team_member_offices", "offices"
  add_foreign_key "team_member_offices", "team_members"
end
