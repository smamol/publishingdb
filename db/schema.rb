# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090906052606) do

  create_table "awards", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "awards", ["name"], :name => "index_awards_on_name", :unique => true

  create_table "awards_people", :id => false, :force => true do |t|
    t.integer "award_id",  :null => false
    t.integer "person_id", :null => false
  end

  add_index "awards_people", ["award_id", "person_id"], :name => "index_awards_people_on_award_id_and_person_id", :unique => true
  add_index "awards_people", ["person_id"], :name => "index_awards_people_on_person_id"

  create_table "occupations", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "occupations", ["name"], :name => "index_occupations_on_name", :unique => true

  create_table "people", :force => true do |t|
    t.string   "first_name",     :null => false
    t.string   "last_name",      :null => false
    t.string   "email"
    t.string   "mobile"
    t.string   "phone_or_skype"
    t.string   "website"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "occupation_id"
  end

  add_index "people", ["first_name", "last_name"], :name => "index_people_on_first_name_and_last_name", :unique => true
  add_index "people", ["id", "occupation_id"], :name => "index_people_on_id_and_occupation_id", :unique => true
  add_index "people", ["first_name", "last_name"], :name => "index_people_on_last_name_and_first_name", :unique => true
  add_index "people", ["occupation_id"], :name => "index_people_on_occupation_id"

  create_table "people_specialties", :id => false, :force => true do |t|
    t.integer "specialty_id", :null => false
    t.integer "person_id",    :null => false
  end

  add_index "people_specialties", ["person_id"], :name => "index_people_specialties_on_person_id"
  add_index "people_specialties", ["person_id", "specialty_id"], :name => "index_people_specialties_on_specialty_id_and_person_id", :unique => true

  create_table "publications", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publications", ["name"], :name => "index_publications_on_name", :unique => true

  create_table "publishings", :force => true do |t|
    t.integer  "person_id",      :null => false
    t.integer  "publication_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publishings", ["person_id", "publication_id"], :name => "index_publishings_on_person_id_and_publication_id", :unique => true
  add_index "publishings", ["publication_id"], :name => "index_publishings_on_publication_id"

  create_table "specialties", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "specialties", ["name"], :name => "index_specialties_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  add_foreign_key "awards_people", ["award_id"], "awards", ["id"], :name => "fk_awards_people_award_id"
  add_foreign_key "awards_people", ["person_id"], "people", ["id"], :name => "fk_awards_people_person_id"

  add_foreign_key "people", ["occupation_id"], "occupations", ["id"], :name => "fk_people_occupations_occupation_id"

  add_foreign_key "people_specialties", ["specialty_id"], "specialties", ["id"], :name => "fk_people_specialties_specialty_id"
  add_foreign_key "people_specialties", ["person_id"], "people", ["id"], :name => "fk_people_specialties_person_id"

  add_foreign_key "publishings", ["publication_id"], "publications", ["id"], :name => "fk_publishings_publication_id"
  add_foreign_key "publishings", ["person_id"], "people", ["id"], :name => "fk_publishings_person_id"

end
