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

ActiveRecord::Schema.define(version: 20171012143605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accreditations", force: :cascade do |t|
    t.integer  "position"
    t.string   "title",      null: false
    t.string   "image",      null: false
    t.string   "link"
    t.datetime "publish_at", null: false
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "additional_contents", force: :cascade do |t|
    t.string   "area",                      null: false
    t.string   "title",                     null: false
    t.text     "content",                   null: false
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "article_categories", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.boolean  "display",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["slug"], name: "index_article_categories_on_slug", unique: true, using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",                                               null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "publish_at",                                          null: false
    t.datetime "expire_at"
    t.string   "social_share_title",       limit: 150
    t.string   "social_share_description"
    t.string   "social_share_image"
    t.text     "summary",                                             null: false
    t.text     "content",                                             null: false
    t.string   "image"
    t.boolean  "home_page_highlight",                  default: true
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
  end

  create_table "articles_categorisations", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "article_category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["article_category_id"], name: "index_articles_categorisations_on_article_category_id", using: :btree
    t.index ["article_id"], name: "index_articles_categorisations_on_article_id", using: :btree
  end

  create_table "audiences", force: :cascade do |t|
    t.string   "title",                                   null: false
    t.text     "summary"
    t.string   "image"
    t.string   "social_share_image"
    t.string   "suggested_url"
    t.string   "slug"
    t.boolean  "display",                  default: true
    t.integer  "services_count",           default: 0,    null: false
    t.integer  "team_member_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "social_share_title"
    t.string   "social_share_description"
    t.string   "colour"
    t.index ["slug"], name: "index_audiences_on_slug", using: :btree
    t.index ["suggested_url"], name: "index_audiences_on_suggested_url", using: :btree
    t.index ["team_member_id"], name: "index_audiences_on_team_member_id", using: :btree
  end

  create_table "audiences_banners", force: :cascade do |t|
    t.integer  "audience_id"
    t.integer  "banner_id"
    t.integer  "position",    default: 0, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["audience_id", "banner_id"], name: "index_audiences_banners_on_audience_id_and_banner_id", unique: true, using: :btree
    t.index ["audience_id"], name: "index_audiences_banners_on_audience_id", using: :btree
    t.index ["banner_id"], name: "index_audiences_banners_on_banner_id", using: :btree
  end

  create_table "awards", force: :cascade do |t|
    t.integer  "position"
    t.string   "title"
    t.string   "image"
    t.string   "link"
    t.datetime "publish_at"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banners", force: :cascade do |t|
    t.integer  "position"
    t.string   "title"
    t.text     "summary"
    t.string   "image",       null: false
    t.string   "button_text"
    t.string   "button_link"
    t.datetime "publish_at",  null: false
    t.datetime "expire_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "service_id"
    t.index ["service_id"], name: "index_banners_on_service_id", using: :btree
  end

  create_table "case_studies", force: :cascade do |t|
    t.string   "title",                                null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "publish_at",                           null: false
    t.datetime "expire_at"
    t.string   "social_share_title",       limit: 150
    t.string   "social_share_description"
    t.string   "social_share_image"
    t.text     "summary",                              null: false
    t.text     "content",                              null: false
    t.string   "image"
    t.date     "date",                                 null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["slug"], name: "index_case_studies_on_slug", unique: true, using: :btree
  end

  create_table "conveyancing_quotes_addresses", force: :cascade do |t|
    t.integer  "conveyancing_quotes_user_id"
    t.string   "address_type",                null: false
    t.string   "house_number",                null: false
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "town",                        null: false
    t.string   "postcode",                    null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["conveyancing_quotes_user_id"], name: "addresses_user_id", using: :btree
  end

  create_table "conveyancing_quotes_deeds", force: :cascade do |t|
    t.integer  "conveyancing_quotes_user_id"
    t.string   "full_name",                   null: false
    t.date     "date_of_birth",               null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["conveyancing_quotes_user_id"], name: "deeds_user_id", using: :btree
  end

  create_table "conveyancing_quotes_equity_transfers", force: :cascade do |t|
    t.string   "title",                               null: false
    t.string   "forename",                            null: false
    t.string   "surname",                             null: false
    t.string   "phone"
    t.string   "email",                               null: false
    t.string   "timeframe"
    t.decimal  "price",      precision: 10, scale: 2, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "conveyancing_quotes_purchases", force: :cascade do |t|
    t.string   "phone"
    t.string   "timeframe"
    t.decimal  "price",                                     precision: 50,                 null: false
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.integer  "conveyancing_quotes_user_id"
    t.boolean  "second_home_or_buy_to_let",                                default: false
    t.boolean  "leasehold_house",                                          default: false
    t.boolean  "leasehold_apartment",                                      default: false
    t.boolean  "help_to_buy_scheme",                                       default: false
    t.boolean  "help_to_buy_isa",                                          default: false
    t.boolean  "shared_ownership_scheme",                                  default: false
    t.integer  "conveyancing_quotes_sale_and_purchases_id"
    t.index ["conveyancing_quotes_sale_and_purchases_id"], name: "sale_and_purchases_purchase_id", using: :btree
    t.index ["conveyancing_quotes_user_id"], name: "purchases_user_id", using: :btree
  end

  create_table "conveyancing_quotes_quote_locations", force: :cascade do |t|
    t.string   "location"
    t.string   "suggested_url"
    t.string   "slug"
    t.boolean  "display",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "details"
    t.index ["location"], name: "index_conveyancing_quotes_quote_locations_on_location", using: :btree
    t.index ["slug"], name: "index_conveyancing_quotes_quote_locations_on_slug", using: :btree
  end

  create_table "conveyancing_quotes_remortgage_with_equity_transfers", force: :cascade do |t|
    t.string   "title",                                          null: false
    t.string   "forename",                                       null: false
    t.string   "surname",                                        null: false
    t.string   "phone"
    t.string   "email",                                          null: false
    t.string   "timeframe"
    t.decimal  "remortgage_price",      precision: 10, scale: 2, null: false
    t.decimal  "equity_transfer_price", precision: 10, scale: 2, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "conveyancing_quotes_remortgages", force: :cascade do |t|
    t.string   "title",                               null: false
    t.string   "forename",                            null: false
    t.string   "surname",                             null: false
    t.string   "phone"
    t.string   "email",                               null: false
    t.string   "timeframe"
    t.decimal  "price",      precision: 10, scale: 2, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "conveyancing_quotes_sale_and_purchases", force: :cascade do |t|
    t.string   "phone"
    t.string   "timeframe"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "conveyancing_quotes_user_id"
    t.index ["conveyancing_quotes_user_id"], name: "sales_and_purchases_user_id", using: :btree
  end

  create_table "conveyancing_quotes_sales", force: :cascade do |t|
    t.string   "phone"
    t.string   "timeframe"
    t.decimal  "price",                                     precision: 50,                 null: false
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.integer  "conveyancing_quotes_user_id"
    t.boolean  "leasehold_house",                                          default: false
    t.boolean  "leasehold_apartment",                                      default: false
    t.boolean  "shared_ownership_scheme",                                  default: false
    t.integer  "conveyancing_quotes_sale_and_purchases_id"
    t.index ["conveyancing_quotes_sale_and_purchases_id"], name: "sale_and_purchases_sale_id", using: :btree
    t.index ["conveyancing_quotes_user_id"], name: "sales_user_id", using: :btree
  end

  create_table "conveyancing_quotes_users", force: :cascade do |t|
    t.string   "title"
    t.string   "forename",                                              null: false
    t.string   "surname",                                               null: false
    t.string   "email",                                                 null: false
    t.string   "phone"
    t.string   "token",                                                 null: false
    t.boolean  "buying",                                default: false
    t.boolean  "selling",                               default: false
    t.boolean  "conveyancing_email_permission",         default: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "conveyancing_quotes_quote_location_id"
    t.boolean  "submitted",                             default: false
    t.boolean  "allow_contact"
    t.index ["conveyancing_quotes_quote_location_id"], name: "quote_location_id", using: :btree
    t.index ["token"], name: "index_conveyancing_quotes_users_on_token", using: :btree
  end

  create_table "department_roles", force: :cascade do |t|
    t.string   "title",                      null: false
    t.string   "slug"
    t.text     "description"
    t.integer  "position",    default: 0,    null: false
    t.boolean  "display",     default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["slug"], name: "index_department_roles_on_slug", unique: true, using: :btree
  end

  create_table "event_categories", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.boolean  "display",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "event_locations", force: :cascade do |t|
    t.string   "title",                         null: false
    t.string   "building_name",                 null: false
    t.string   "address_line_1",                null: false
    t.string   "address_line_2"
    t.string   "city",                          null: false
    t.string   "postcode",                      null: false
    t.string   "latitude"
    t.string   "longitude"
    t.text     "details"
    t.boolean  "display",        default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "slug"
    t.string   "suggested_url"
    t.index ["slug"], name: "index_event_locations_on_slug", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",                                null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "publish_at",                           null: false
    t.datetime "expire_at"
    t.text     "summary",                              null: false
    t.text     "content"
    t.datetime "event_start",                          null: false
    t.datetime "event_end",                            null: false
    t.string   "booking_link"
    t.datetime "booking_deadline"
    t.string   "image"
    t.string   "social_share_title",       limit: 150
    t.string   "social_share_description"
    t.string   "social_share_image"
    t.integer  "event_location_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["event_location_id"], name: "index_events_on_event_location_id", using: :btree
    t.index ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  end

  create_table "events_categorisations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "event_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["event_category_id"], name: "index_events_categorisations_on_event_category_id", using: :btree
    t.index ["event_id"], name: "index_events_categorisations_on_event_id", using: :btree
  end

  create_table "features", force: :cascade do |t|
    t.string   "key",                        null: false
    t.boolean  "enabled",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "flipflop_features", force: :cascade do |t|
    t.string   "key",        null: false
    t.boolean  "enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frequently_asked_questions", force: :cascade do |t|
    t.text     "question",                  null: false
    t.text     "answer",                    null: false
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
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer  "job_listing_id"
    t.string   "forename",       null: false
    t.string   "surname",        null: false
    t.string   "email"
    t.string   "phone"
    t.string   "cv",             null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["job_listing_id"], name: "index_job_applications_on_job_listing_id", using: :btree
  end

  create_table "job_listings", force: :cascade do |t|
    t.string   "title",                              null: false
    t.text     "summary",                            null: false
    t.text     "description",                        null: false
    t.string   "salary"
    t.date     "start_date"
    t.string   "role_type"
    t.string   "hours"
    t.string   "contract_type"
    t.integer  "office_id"
    t.date     "application_deadline"
    t.datetime "publish_at",                         null: false
    t.datetime "expire_at"
    t.string   "slug"
    t.string   "suggested_url"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "job_applications_count", default: 0
    t.string   "application_method"
    t.index ["office_id"], name: "index_job_listings_on_office_id", using: :btree
    t.index ["slug"], name: "index_job_listings_on_slug", using: :btree
  end

  create_table "job_roles", force: :cascade do |t|
    t.string   "title",                      null: false
    t.string   "slug"
    t.text     "description"
    t.integer  "position",    default: 0,    null: false
    t.boolean  "display",     default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["slug"], name: "index_job_roles_on_slug", unique: true, using: :btree
  end

  create_table "mailchimp_lists", force: :cascade do |t|
    t.string   "title",             null: false
    t.string   "mailchimp_list_id", null: false
    t.integer  "module_id"
    t.string   "module_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "office_locations", force: :cascade do |t|
    t.string   "name",                         null: false
    t.boolean  "display",       default: true
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["slug"], name: "index_office_locations_on_slug", using: :btree
    t.index ["suggested_url"], name: "index_office_locations_on_suggested_url", using: :btree
  end

  create_table "offices", force: :cascade do |t|
    t.string   "building_name"
    t.string   "address_line_1",     null: false
    t.string   "address_line_2"
    t.integer  "office_location_id"
    t.string   "postcode",           null: false
    t.string   "phone_number",       null: false
    t.string   "fax_number"
    t.string   "email"
    t.string   "dx_number"
    t.text     "details"
    t.string   "image"
    t.datetime "publish_at",         null: false
    t.datetime "expire_at"
    t.string   "suggested_url"
    t.string   "slug"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "page_title"
    t.index ["office_location_id"], name: "index_offices_on_office_location_id", using: :btree
    t.index ["slug"], name: "index_offices_on_slug", using: :btree
    t.index ["suggested_url"], name: "index_offices_on_suggested_url", using: :btree
  end

  create_table "onpage_navigations", force: :cascade do |t|
    t.integer  "position"
    t.string   "title",                                  null: false
    t.string   "button_text"
    t.integer  "module_id",                              null: false
    t.string   "module_type",                            null: false
    t.string   "partial",                                null: false
    t.integer  "results_limit"
    t.string   "anchor",                                 null: false
    t.boolean  "display_navigation_link", default: true
    t.boolean  "display_content",         default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "layout"
  end

  create_table "onpage_navigations_accreditations", force: :cascade do |t|
    t.integer  "onpage_navigation_id"
    t.integer  "accreditation_id"
    t.integer  "position",             default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["accreditation_id"], name: "index_onpage_navigations_accreditations_on_accreditation_id", using: :btree
    t.index ["onpage_navigation_id"], name: "index_onpage_navigations_accreditations_on_onpage_navigation_id", using: :btree
  end

  create_table "onpage_navigations_articles", force: :cascade do |t|
    t.integer  "onpage_navigation_id"
    t.integer  "article_id"
    t.integer  "position",             default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["article_id"], name: "index_onpage_navigations_articles_on_article_id", using: :btree
    t.index ["onpage_navigation_id"], name: "index_onpage_navigations_articles_on_onpage_navigation_id", using: :btree
  end

  create_table "onpage_navigations_content_items", force: :cascade do |t|
    t.integer  "position"
    t.string   "title"
    t.text     "content",                              null: false
    t.boolean  "display",              default: true
    t.boolean  "content_click_toggle", default: false
    t.integer  "onpage_navigation_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["onpage_navigation_id"], name: "index_onpage_navigations_content_items_on_onpage_navigation_id", using: :btree
  end

  create_table "onpage_navigations_faqs", force: :cascade do |t|
    t.integer  "onpage_navigation_id"
    t.integer  "frequently_asked_question_id"
    t.integer  "position",                     default: 0, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["frequently_asked_question_id"], name: "index_onpage_navigations_faqs_on_frequently_asked_question_id", using: :btree
    t.index ["onpage_navigation_id"], name: "index_onpage_navigations_faqs_on_onpage_navigation_id", using: :btree
  end

  create_table "onpage_navigations_resources", force: :cascade do |t|
    t.integer  "onpage_navigation_id"
    t.integer  "resource_id"
    t.integer  "position",             default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["onpage_navigation_id"], name: "index_onpage_navigations_resources_on_onpage_navigation_id", using: :btree
    t.index ["resource_id"], name: "index_onpage_navigations_resources_on_resource_id", using: :btree
  end

  create_table "onpage_navigations_service_pages", force: :cascade do |t|
    t.integer  "onpage_navigation_id"
    t.integer  "services_page_id"
    t.integer  "position",             default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["onpage_navigation_id"], name: "index_onpage_navigations_service_pages_on_onpage_navigation_id", using: :btree
    t.index ["services_page_id"], name: "index_onpage_navigations_service_pages_on_services_page_id", using: :btree
  end

  create_table "onpage_navigations_team_members", force: :cascade do |t|
    t.integer  "onpage_navigation_id"
    t.integer  "team_member_id"
    t.integer  "position",             default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["onpage_navigation_id"], name: "index_onpage_navigations_team_members_on_onpage_navigation_id", using: :btree
    t.index ["team_member_id"], name: "index_onpage_navigations_team_members_on_team_member_id", using: :btree
  end

  create_table "onpage_navigations_testimonials", force: :cascade do |t|
    t.integer  "onpage_navigation_id"
    t.integer  "testimonial_id"
    t.integer  "position",             default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["onpage_navigation_id"], name: "index_onpage_navigations_testimonials_on_onpage_navigation_id", using: :btree
    t.index ["testimonial_id"], name: "index_onpage_navigations_testimonials_on_testimonial_id", using: :btree
  end

  create_table "onpage_navigations_videos", force: :cascade do |t|
    t.integer  "onpage_navigation_id"
    t.integer  "video_id"
    t.integer  "position",             default: 0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["onpage_navigation_id"], name: "index_onpage_navigations_videos_on_onpage_navigation_id", using: :btree
    t.index ["video_id"], name: "index_onpage_navigations_videos_on_video_id", using: :btree
  end

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
    t.index ["auth_token"], name: "index_optimadmin_administrators_on_auth_token", using: :btree
    t.index ["email"], name: "index_optimadmin_administrators_on_email", using: :btree
    t.index ["username"], name: "index_optimadmin_administrators_on_username", using: :btree
  end

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
    t.index ["ancestor_id", "descendant_id", "generations"], name: "menu_item_anc_desc_idx", unique: true, using: :btree
    t.index ["descendant_id"], name: "menu_item_desc_idx", using: :btree
  end

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
    t.boolean  "display",                     default: true
    t.index ["link_id"], name: "index_optimadmin_menu_items_on_link_id", using: :btree
  end

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

  create_table "pages", force: :cascade do |t|
    t.string   "title",                                null: false
    t.string   "slug"
    t.string   "suggested_url"
    t.string   "image"
    t.string   "style",                                null: false
    t.string   "layout",                               null: false
    t.text     "content",                              null: false
    t.datetime "publish_at",                           null: false
    t.datetime "expire_at"
    t.string   "social_share_title",       limit: 150
    t.string   "social_share_description"
    t.string   "social_share_image"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "subtitle"
    t.text     "summary"
  end

  create_table "payments", force: :cascade do |t|
    t.string   "invoice_number",                          null: false
    t.string   "name",                                    null: false
    t.string   "contact_number",                          null: false
    t.decimal  "amount",         precision: 15, scale: 2, null: false
    t.string   "code",                                    null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.string   "searchable_type"
    t.integer  "searchable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree
  end

  create_table "resource_categories", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.boolean  "display",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["slug"], name: "index_resource_categories_on_slug", using: :btree
  end

  create_table "resources", force: :cascade do |t|
    t.string   "title",                              null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "publish_at",                         null: false
    t.datetime "expire_at"
    t.text     "summary"
    t.text     "content"
    t.string   "file",                               null: false
    t.string   "image"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "homepage_highlight", default: false
    t.boolean  "protected",          default: false
    t.index ["slug"], name: "index_resources_on_slug", unique: true, using: :btree
  end

  create_table "resources_categorisations", force: :cascade do |t|
    t.integer  "resource_id"
    t.integer  "resource_category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["resource_category_id"], name: "index_resources_categorisations_on_resource_category_id", using: :btree
    t.index ["resource_id"], name: "index_resources_categorisations_on_resource_id", using: :btree
  end

  create_table "resources_downloads", force: :cascade do |t|
    t.integer  "resource_id"
    t.string   "forename",    null: false
    t.string   "surname",     null: false
    t.string   "email",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["resource_id"], name: "index_resources_downloads_on_resource_id", using: :btree
  end

  create_table "rich_snippets", force: :cascade do |t|
    t.decimal  "rating_value", precision: 2, scale: 1,                null: false
    t.integer  "rating_count",                                        null: false
    t.string   "description"
    t.boolean  "display",                              default: true, null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "seo_entry_id"
    t.string   "title"
    t.index ["seo_entry_id"], name: "index_rich_snippets_on_seo_entry_id", using: :btree
  end

  create_table "seo_entries", force: :cascade do |t|
    t.string   "nominal_url"
    t.string   "title"
    t.text     "meta_description"
    t.boolean  "in_sitemap",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seo_tracking_codes", force: :cascade do |t|
    t.string   "layout",     null: false
    t.text     "head"
    t.text     "footer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["layout"], name: "index_seo_tracking_codes_on_layout", using: :btree
  end

  create_table "service_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "service_anc_desc_idx", unique: true, using: :btree
    t.index ["descendant_id"], name: "service_desc_idx", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.integer  "audience_id",                                            null: false
    t.integer  "parent_id"
    t.string   "title",                                                  null: false
    t.text     "summary",                                                null: false
    t.text     "content"
    t.text     "social_share_title"
    t.text     "social_share_description"
    t.string   "social_share_image"
    t.string   "image"
    t.string   "colour"
    t.string   "icon"
    t.boolean  "homepage_highlight",             default: false
    t.string   "slug"
    t.string   "suggested_url"
    t.datetime "publish_at",                                             null: false
    t.datetime "expire_at"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "inheritance_id"
    t.boolean  "audience_highlight",             default: false
    t.integer  "position"
    t.string   "layout",                         default: "application", null: false
    t.string   "style",                          default: "basic",       null: false
    t.boolean  "landing_page",                   default: false
    t.boolean  "show_contact_form"
    t.boolean  "inherit_sidebar_text"
    t.boolean  "inherit_page_layout_content"
    t.boolean  "hide_preferred_office_on_forms"
    t.string   "custom_page_title"
    t.index ["audience_id"], name: "index_services_on_audience_id", using: :btree
    t.index ["inheritance_id"], name: "index_services_on_inheritance_id", using: :btree
    t.index ["slug"], name: "index_services_on_slug", using: :btree
    t.index ["suggested_url"], name: "index_services_on_suggested_url", using: :btree
  end

  create_table "services_accreditations", force: :cascade do |t|
    t.integer  "position"
    t.integer  "service_id"
    t.integer  "accreditation_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["accreditation_id"], name: "index_services_accreditations_on_accreditation_id", using: :btree
    t.index ["service_id"], name: "index_services_accreditations_on_service_id", using: :btree
  end

  create_table "services_articles", force: :cascade do |t|
    t.integer  "service_id", null: false
    t.integer  "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_services_articles_on_article_id", using: :btree
    t.index ["service_id"], name: "index_services_articles_on_service_id", using: :btree
  end

  create_table "services_case_studies", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "case_study_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["case_study_id"], name: "index_services_case_studies_on_case_study_id", using: :btree
    t.index ["service_id"], name: "index_services_case_studies_on_service_id", using: :btree
  end

  create_table "services_events", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_services_events_on_event_id", using: :btree
    t.index ["service_id"], name: "index_services_events_on_service_id", using: :btree
  end

  create_table "services_faqs", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "frequently_asked_question_id"
    t.integer  "position"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["frequently_asked_question_id"], name: "index_services_faqs_on_frequently_asked_question_id", using: :btree
    t.index ["service_id"], name: "index_services_faqs_on_service_id", using: :btree
  end

  create_table "services_offices", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_services_offices_on_office_id", using: :btree
    t.index ["service_id"], name: "index_services_offices_on_service_id", using: :btree
  end

  create_table "services_page_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "services_page_anc_desc_idx", unique: true, using: :btree
    t.index ["descendant_id"], name: "services_page_desc_idx", using: :btree
  end

  create_table "services_pages", force: :cascade do |t|
    t.string   "title",                                            null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "publish_at",                                       null: false
    t.datetime "expire_at"
    t.string   "social_share_title",       limit: 150
    t.string   "social_share_description"
    t.string   "social_share_image"
    t.string   "style",                                            null: false
    t.string   "layout",                                           null: false
    t.string   "content"
    t.string   "image"
    t.integer  "service_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.text     "summary"
    t.integer  "position",                             default: 0, null: false
    t.integer  "parent_id"
    t.index ["service_id"], name: "index_services_pages_on_service_id", using: :btree
  end

  create_table "services_related_services", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "related_service_id"
    t.integer  "position"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["related_service_id"], name: "index_services_related_services_on_related_service_id", using: :btree
    t.index ["service_id"], name: "index_services_related_services_on_service_id", using: :btree
  end

  create_table "services_resources", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "resource_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["resource_id"], name: "index_services_resources_on_resource_id", using: :btree
    t.index ["service_id"], name: "index_services_resources_on_service_id", using: :btree
  end

  create_table "services_team_members", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "team_member_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "position"
    t.boolean  "key_team_member", default: false
    t.index ["service_id"], name: "index_services_team_members_on_service_id", using: :btree
    t.index ["team_member_id"], name: "index_services_team_members_on_team_member_id", using: :btree
  end

  create_table "services_testimonials", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "testimonial_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["service_id"], name: "index_services_testimonials_on_service_id", using: :btree
    t.index ["testimonial_id"], name: "index_services_testimonials_on_testimonial_id", using: :btree
  end

  create_table "services_videos", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_services_videos_on_service_id", using: :btree
    t.index ["video_id"], name: "index_services_videos_on_video_id", using: :btree
  end

  create_table "team_members", force: :cascade do |t|
    t.string   "forename",            null: false
    t.string   "surname",             null: false
    t.string   "image"
    t.string   "primary_telephone"
    t.string   "secondary_telephone"
    t.string   "email_address"
    t.string   "has_vcard_download"
    t.string   "google_plus_link"
    t.string   "twitter_link"
    t.string   "facebook_link"
    t.string   "mobile_number"
    t.string   "dx_number"
    t.text     "profile"
    t.text     "specialisms"
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "publish_at",          null: false
    t.datetime "expire_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "position"
    t.string   "linkedin_link"
    t.index ["slug"], name: "index_team_members_on_slug", using: :btree
    t.index ["suggested_url"], name: "index_team_members_on_suggested_url", using: :btree
  end

  create_table "team_members_accreditations", force: :cascade do |t|
    t.integer  "position"
    t.integer  "team_member_id"
    t.integer  "accreditation_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["accreditation_id"], name: "index_team_members_accreditations_on_accreditation_id", using: :btree
    t.index ["team_member_id"], name: "index_team_members_accreditations_on_team_member_id", using: :btree
  end

  create_table "team_members_articles", force: :cascade do |t|
    t.integer  "team_member_id"
    t.integer  "article_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["article_id"], name: "index_team_members_articles_on_article_id", using: :btree
    t.index ["team_member_id"], name: "index_team_members_articles_on_team_member_id", using: :btree
  end

  create_table "team_members_awards", force: :cascade do |t|
    t.integer  "position"
    t.integer  "team_member_id"
    t.integer  "award_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["award_id"], name: "index_team_members_awards_on_award_id", using: :btree
    t.index ["team_member_id"], name: "index_team_members_awards_on_team_member_id", using: :btree
  end

  create_table "team_members_department_roles", force: :cascade do |t|
    t.integer  "position"
    t.integer  "team_member_id",     null: false
    t.integer  "department_role_id", null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["department_role_id"], name: "index_team_members_department_roles_on_department_role_id", using: :btree
    t.index ["team_member_id"], name: "index_team_members_department_roles_on_team_member_id", using: :btree
  end

  create_table "team_members_events", force: :cascade do |t|
    t.integer  "team_member_id"
    t.integer  "event_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["event_id"], name: "index_team_members_events_on_event_id", using: :btree
    t.index ["team_member_id"], name: "index_team_members_events_on_team_member_id", using: :btree
  end

  create_table "team_members_job_roles", force: :cascade do |t|
    t.integer  "position"
    t.integer  "team_member_id", null: false
    t.integer  "job_role_id",    null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["job_role_id"], name: "index_team_members_job_roles_on_job_role_id", using: :btree
    t.index ["team_member_id"], name: "index_team_members_job_roles_on_team_member_id", using: :btree
  end

  create_table "team_members_offices", force: :cascade do |t|
    t.integer  "team_member_id"
    t.integer  "office_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "position"
    t.index ["office_id"], name: "index_team_members_offices_on_office_id", using: :btree
    t.index ["team_member_id"], name: "index_team_members_offices_on_team_member_id", using: :btree
  end

  create_table "team_members_testimonials", force: :cascade do |t|
    t.integer  "team_member_id"
    t.integer  "testimonial_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "position"
    t.index ["team_member_id"], name: "index_team_members_testimonials_on_team_member_id", using: :btree
    t.index ["testimonial_id"], name: "index_team_members_testimonials_on_testimonial_id", using: :btree
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "author_name"
    t.string   "author_company"
    t.string   "image"
    t.text     "recommendation",                     null: false
    t.integer  "position"
    t.datetime "publish_at",                         null: false
    t.datetime "expire_at"
    t.boolean  "home_page_highlight", default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "video_categories", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.boolean  "display",       default: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["slug"], name: "index_video_categories_on_slug", using: :btree
    t.index ["suggested_url"], name: "index_video_categories_on_suggested_url", using: :btree
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title",                    null: false
    t.string   "suggested_url"
    t.string   "slug"
    t.string   "image"
    t.string   "social_share_image"
    t.datetime "publish_at",               null: false
    t.datetime "expire_at"
    t.text     "summary"
    t.string   "youtube_url"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "social_share_title"
    t.string   "social_share_description"
    t.index ["slug"], name: "index_videos_on_slug", unique: true, using: :btree
  end

  create_table "videos_categorisations", force: :cascade do |t|
    t.integer  "video_id"
    t.integer  "video_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["video_category_id"], name: "index_videos_categorisations_on_video_category_id", using: :btree
    t.index ["video_id"], name: "index_videos_categorisations_on_video_id", using: :btree
  end

  add_foreign_key "articles_categorisations", "article_categories"
  add_foreign_key "articles_categorisations", "articles"
  add_foreign_key "audiences", "team_members", on_delete: :nullify
  add_foreign_key "audiences_banners", "audiences", on_delete: :cascade
  add_foreign_key "audiences_banners", "banners", on_delete: :cascade
  add_foreign_key "banners", "services"
  add_foreign_key "conveyancing_quotes_addresses", "conveyancing_quotes_users"
  add_foreign_key "conveyancing_quotes_deeds", "conveyancing_quotes_users"
  add_foreign_key "conveyancing_quotes_purchases", "conveyancing_quotes_sale_and_purchases", column: "conveyancing_quotes_sale_and_purchases_id"
  add_foreign_key "conveyancing_quotes_purchases", "conveyancing_quotes_users"
  add_foreign_key "conveyancing_quotes_sale_and_purchases", "conveyancing_quotes_users"
  add_foreign_key "conveyancing_quotes_sales", "conveyancing_quotes_sale_and_purchases", column: "conveyancing_quotes_sale_and_purchases_id"
  add_foreign_key "conveyancing_quotes_sales", "conveyancing_quotes_users"
  add_foreign_key "events", "event_locations"
  add_foreign_key "events_categorisations", "event_categories"
  add_foreign_key "events_categorisations", "events"
  add_foreign_key "job_applications", "job_listings"
  add_foreign_key "job_listings", "offices"
  add_foreign_key "offices", "office_locations"
  add_foreign_key "onpage_navigations_accreditations", "accreditations"
  add_foreign_key "onpage_navigations_accreditations", "onpage_navigations"
  add_foreign_key "onpage_navigations_articles", "articles"
  add_foreign_key "onpage_navigations_articles", "onpage_navigations"
  add_foreign_key "onpage_navigations_content_items", "onpage_navigations"
  add_foreign_key "onpage_navigations_faqs", "frequently_asked_questions"
  add_foreign_key "onpage_navigations_faqs", "onpage_navigations"
  add_foreign_key "onpage_navigations_resources", "onpage_navigations"
  add_foreign_key "onpage_navigations_resources", "resources"
  add_foreign_key "onpage_navigations_service_pages", "onpage_navigations"
  add_foreign_key "onpage_navigations_service_pages", "services_pages"
  add_foreign_key "onpage_navigations_team_members", "onpage_navigations"
  add_foreign_key "onpage_navigations_team_members", "team_members"
  add_foreign_key "onpage_navigations_testimonials", "onpage_navigations"
  add_foreign_key "onpage_navigations_testimonials", "testimonials"
  add_foreign_key "onpage_navigations_videos", "onpage_navigations"
  add_foreign_key "onpage_navigations_videos", "videos"
  add_foreign_key "resources_categorisations", "resource_categories"
  add_foreign_key "resources_categorisations", "resources"
  add_foreign_key "resources_downloads", "resources"
  add_foreign_key "rich_snippets", "seo_entries"
  add_foreign_key "services", "audiences", on_delete: :nullify
  add_foreign_key "services_accreditations", "accreditations"
  add_foreign_key "services_accreditations", "services"
  add_foreign_key "services_articles", "articles"
  add_foreign_key "services_articles", "services"
  add_foreign_key "services_case_studies", "case_studies"
  add_foreign_key "services_case_studies", "services"
  add_foreign_key "services_events", "events"
  add_foreign_key "services_events", "services"
  add_foreign_key "services_faqs", "frequently_asked_questions"
  add_foreign_key "services_faqs", "services"
  add_foreign_key "services_offices", "offices"
  add_foreign_key "services_offices", "services"
  add_foreign_key "services_pages", "services", on_delete: :nullify
  add_foreign_key "services_related_services", "services"
  add_foreign_key "services_resources", "resources"
  add_foreign_key "services_resources", "services"
  add_foreign_key "services_team_members", "services"
  add_foreign_key "services_team_members", "team_members"
  add_foreign_key "services_testimonials", "services"
  add_foreign_key "services_testimonials", "testimonials"
  add_foreign_key "services_videos", "services"
  add_foreign_key "services_videos", "videos"
  add_foreign_key "team_members_accreditations", "accreditations"
  add_foreign_key "team_members_accreditations", "team_members"
  add_foreign_key "team_members_articles", "articles"
  add_foreign_key "team_members_articles", "team_members"
  add_foreign_key "team_members_awards", "awards"
  add_foreign_key "team_members_awards", "team_members"
  add_foreign_key "team_members_department_roles", "department_roles"
  add_foreign_key "team_members_department_roles", "team_members"
  add_foreign_key "team_members_events", "events"
  add_foreign_key "team_members_events", "team_members"
  add_foreign_key "team_members_job_roles", "job_roles"
  add_foreign_key "team_members_job_roles", "team_members"
  add_foreign_key "team_members_offices", "offices"
  add_foreign_key "team_members_offices", "team_members"
  add_foreign_key "team_members_testimonials", "team_members"
  add_foreign_key "team_members_testimonials", "testimonials"
  add_foreign_key "videos_categorisations", "video_categories"
  add_foreign_key "videos_categorisations", "videos"
end
