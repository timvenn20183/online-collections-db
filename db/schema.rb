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

ActiveRecord::Schema.define(:version => 20130721135822) do

  create_table "articles_things", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "thing_id"
  end

  add_index "articles_things", ["article_id"], :name => "index_articles_things_on_article_id"
  add_index "articles_things", ["thing_id"], :name => "index_articles_things_on_thing_id"

  create_table "blogs", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.date     "publish_date"
    t.date     "withdraw_date"
    t.boolean  "draft",            :default => true
    t.boolean  "front_page",       :default => false
    t.integer  "order",            :default => 0
    t.string   "cached_slug"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "trashed"
    t.integer  "views"
    t.datetime "last_edited_date"
    t.integer  "gallery_id"
  end

  create_table "blogs_categories", :id => false, :force => true do |t|
    t.integer "blog_id"
    t.integer "category_id"
  end

  add_index "blogs_categories", ["blog_id"], :name => "index_blogs_categories_on_blog_id"
  add_index "blogs_categories", ["category_id"], :name => "index_blogs_categories_on_category_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "cached_slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categories_things", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "thing_id"
  end

  add_index "categories_things", ["category_id"], :name => "index_categories_things_on_category_id"
  add_index "categories_things", ["thing_id"], :name => "index_categories_things_on_thing_id"

  create_table "comments", :force => true do |t|
    t.string   "email_address"
    t.text     "detail"
    t.integer  "thing_id"
    t.integer  "blog_id"
    t.integer  "gallery_id"
    t.boolean  "approved"
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "subject"
  end

  create_table "conditions", :force => true do |t|
    t.string   "name"
    t.string   "cached_slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "conditions_things", :id => false, :force => true do |t|
    t.integer "condition_id"
    t.integer "thing_id"
  end

  add_index "conditions_things", ["condition_id"], :name => "index_conditions_things_on_condition_id"
  add_index "conditions_things", ["thing_id"], :name => "index_conditions_things_on_thing_id"

  create_table "dialogs", :force => true do |t|
    t.integer  "user_id"
    t.string   "code"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fieldoptions", :force => true do |t|
    t.string   "name"
    t.integer  "thingfield_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "fieldoptions", ["thingfield_id"], :name => "index_fieldoptions_on_thingfield_id"

  create_table "fieldoptions_things", :primary_key => "alt_id", :force => true do |t|
    t.integer "thing_id"
    t.integer "fieldoption_id"
    t.integer "thingfield_id"
  end

  add_index "fieldoptions_things", ["fieldoption_id"], :name => "index_fieldoptions_things_on_fieldoption_id"
  add_index "fieldoptions_things", ["thing_id"], :name => "index_fieldoptions_things_on_thing_id"
  add_index "fieldoptions_things", ["thingfield_id"], :name => "index_fieldoptions_things_on_thingfield_id"

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.integer  "views"
    t.string   "cached_slug"
    t.text     "caption"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "md5"
  end

  create_table "media_things", :id => false, :force => true do |t|
    t.integer "media_id"
    t.integer "thing_id"
  end

  add_index "media_things", ["media_id"], :name => "index_media_things_on_media_id"
  add_index "media_things", ["thing_id"], :name => "index_media_things_on_thing_id"

  create_table "platforms", :force => true do |t|
    t.string   "name"
    t.string   "cached_slug"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "image"
    t.integer  "webring_id"
    t.string   "menuname"
    t.text     "note"
    t.boolean  "public_visible", :default => true
  end

  create_table "platforms_things", :id => false, :force => true do |t|
    t.integer "platform_id"
    t.integer "thing_id"
  end

  add_index "platforms_things", ["platform_id"], :name => "index_platforms_things_on_platform_id"
  add_index "platforms_things", ["thing_id"], :name => "index_platforms_things_on_thing_id"

  create_table "rolodexes", :force => true do |t|
    t.string   "name"
    t.integer  "rolodex_type", :default => 0
    t.string   "email"
    t.string   "cell"
    t.string   "tel"
    t.string   "password"
    t.string   "username"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.text     "history"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "address"
    t.string   "province"
    t.string   "city"
  end

  create_table "rolodexes_things", :id => false, :force => true do |t|
    t.integer "rolodex_id"
    t.integer "thing_id"
  end

  add_index "rolodexes_things", ["rolodex_id"], :name => "index_rolodexes_things_on_rolodex_id"
  add_index "rolodexes_things", ["thing_id"], :name => "index_rolodexes_things_on_thing_id"

  create_table "sites", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.text     "meta_keywords"
    t.text     "meta_description"
    t.string   "owner"
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.string   "header"
    t.string   "tagline"
    t.boolean  "items_help",       :default => true
    t.boolean  "collections_help", :default => true
    t.boolean  "tags_help",        :default => true
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"
  add_index "slugs", ["sluggable_type"], :name => "index_slugs_on_sluggable_type"

  create_table "thingfields", :force => true do |t|
    t.string   "name"
    t.integer  "etype"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "things", :force => true do |t|
    t.string   "name"
    t.integer  "collection_id"
    t.integer  "visability",       :default => 0
    t.boolean  "active",           :default => true
    t.integer  "year",             :default => 1981
    t.float    "value",            :default => 0.0
    t.float    "cost",             :default => 0.0
    t.string   "cached_slug"
    t.string   "alphabet_letter"
    t.date     "release_date"
    t.string   "reference_number"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "mainimage"
    t.string   "template",         :default => "generic"
    t.integer  "views"
    t.integer  "inside_id"
    t.string   "searchstring"
    t.date     "aquire_date"
    t.integer  "aquired_from"
    t.boolean  "public_visible",   :default => true
  end

  create_table "things_virtualcollections", :id => false, :force => true do |t|
    t.integer "thing_id"
    t.integer "virtualcollection_id"
  end

  add_index "things_virtualcollections", ["thing_id"], :name => "index_things_virtualcollections_on_thing_id"
  add_index "things_virtualcollections", ["virtualcollection_id"], :name => "index_things_virtualcollections_on_virtualcollection_id"

  create_table "versions", :force => true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "user_name"
    t.text     "modifications"
    t.integer  "number"
    t.integer  "reverted_from"
    t.string   "tag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "versions", ["created_at"], :name => "index_versions_on_created_at"
  add_index "versions", ["number"], :name => "index_versions_on_number"
  add_index "versions", ["tag"], :name => "index_versions_on_tag"
  add_index "versions", ["user_id", "user_type"], :name => "index_versions_on_user_id_and_user_type"
  add_index "versions", ["user_name"], :name => "index_versions_on_user_name"
  add_index "versions", ["versioned_id", "versioned_type"], :name => "index_versions_on_versioned_id_and_versioned_type"

  create_table "virtualcollections", :force => true do |t|
    t.string   "name"
    t.string   "cached_slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "webring_id"
    t.text     "note"
    t.integer  "site_id"
  end

  create_table "webrings", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => true
    t.text     "code"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

end
