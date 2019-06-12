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

ActiveRecord::Schema.define(version: 2019_06_11_181728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "clients", force: :cascade do |t|
    t.string "nom"
    t.string "siret"
    t.string "adresse"
    t.string "cp"
    t.string "ville"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employeurs", force: :cascade do |t|
    t.string "nom"
    t.string "siret"
    t.string "adresse"
    t.string "cp"
    t.string "ville"
    t.string "tel"
    t.string "email"
    t.string "email2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facture_lignes", force: :cascade do |t|
    t.bigint "prestation_id"
    t.bigint "facture_id"
    t.date "debut"
    t.date "fin"
    t.integer "qte"
    t.float "km"
    t.float "hsup"
    t.float "montant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facture_id"], name: "index_facture_lignes_on_facture_id"
    t.index ["prestation_id"], name: "index_facture_lignes_on_prestation_id"
  end

  create_table "factures", force: :cascade do |t|
    t.bigint "employeur_id"
    t.integer "numero"
    t.date "debut"
    t.date "fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employeur_id"], name: "index_factures_on_employeur_id"
  end

  create_table "intemperies", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jourferies", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machines", force: :cascade do |t|
    t.string "marque"
    t.string "modele"
    t.string "poids"
    t.string "idlocatier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prestations", force: :cascade do |t|
    t.bigint "employeur_id"
    t.bigint "client_id"
    t.bigint "machine_id"
    t.date "debut"
    t.date "fin"
    t.integer "nbjour"
    t.integer "hsup"
    t.string "adresse"
    t.string "ville"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nomchef"
    t.string "tel"
    t.string "bondecommande"
    t.integer "km"
    t.index ["client_id"], name: "index_prestations_on_client_id"
    t.index ["employeur_id"], name: "index_prestations_on_employeur_id"
    t.index ["machine_id"], name: "index_prestations_on_machine_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "facture_lignes", "factures"
  add_foreign_key "facture_lignes", "prestations"
  add_foreign_key "factures", "employeurs"
  add_foreign_key "prestations", "clients"
  add_foreign_key "prestations", "employeurs"
  add_foreign_key "prestations", "machines"
end
