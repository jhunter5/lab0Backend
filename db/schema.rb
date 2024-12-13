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

ActiveRecord::Schema[7.0].define(version: 2024_12_13_041221) do
  create_table "municipios", force: :cascade do |t|
    t.string "nombre"
    t.integer "area"
    t.float "presupuesto"
    t.integer "persona_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_municipios_on_persona_id"
  end

  create_table "personas", force: :cascade do |t|
    t.string "nombre"
    t.string "telefono"
    t.integer "edad"
    t.string "sexo"
    t.integer "vivienda_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vivienda_id"], name: "index_personas_on_vivienda_id"
  end

  create_table "propietarios", force: :cascade do |t|
    t.integer "persona_id", null: false
    t.integer "vivienda_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["persona_id"], name: "index_propietarios_on_persona_id"
    t.index ["vivienda_id"], name: "index_propietarios_on_vivienda_id"
  end

  create_table "viviendas", force: :cascade do |t|
    t.string "direccion"
    t.integer "capacidad"
    t.integer "niveles"
    t.integer "municipio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_viviendas_on_municipio_id"
  end

  add_foreign_key "municipios", "personas"
  add_foreign_key "personas", "viviendas"
  add_foreign_key "propietarios", "personas"
  add_foreign_key "propietarios", "viviendas"
  add_foreign_key "viviendas", "municipios"
end
