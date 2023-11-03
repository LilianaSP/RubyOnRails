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

ActiveRecord::Schema[7.1].define(version: 2023_10_27_162726) do
  create_table "attacks", force: :cascade do |t|
    t.string "tipoDeAtack"
    t.integer "pokemon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_attacks_on_pokemon_id"
  end

  create_table "held_items", force: :cascade do |t|
    t.string "effect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["id"], name: "index_held_items_on_id", unique: true
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "skill"
    t.string "nature"
    t.integer "team_pokemon_id", null: false
    t.integer "held_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "atack"
    t.string "name"
    t.index ["held_item_id"], name: "index_pokemons_on_held_item_id"
    t.index ["id"], name: "index_pokemons_on_id", unique: true
    t.index ["team_pokemon_id"], name: "index_pokemons_on_team_pokemon_id"
  end

  create_table "team_pokemons", force: :cascade do |t|
    t.string "nombre"
    t.string "categoria"
    t.string "Autor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_team_pokemons_on_id", unique: true
  end

  add_foreign_key "attacks", "pokemons"
  add_foreign_key "pokemons", "held_items"
  add_foreign_key "pokemons", "team_pokemons"
end
