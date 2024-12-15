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

ActiveRecord::Schema[7.0].define(version: 2024_12_14_204132) do
  create_table "alcaldias", force: :cascade do |t|
    t.string "direccion"
    t.string "email"
    t.float "presupuesto_anual"
    t.datetime "fecha_inicio"
    t.datetime "fecha_fin"
    t.boolean "activo"
    t.integer "municipio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipio_id"], name: "index_alcaldias_on_municipio_id"
  end

  create_table "empleados", force: :cascade do |t|
    t.float "salario"
    t.string "tipo_contrato"
    t.integer "años_experiencia"
    t.datetime "fecha_ingreso"
    t.boolean "activo"
    t.integer "rol_id", null: false
    t.integer "alcaldia_id", null: false
    t.integer "persona_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alcaldia_id"], name: "index_empleados_on_alcaldia_id"
    t.index ["persona_id"], name: "index_empleados_on_persona_id"
    t.index ["rol_id"], name: "index_empleados_on_rol_id"
  end

  create_table "municipios", force: :cascade do |t|
    t.string "nombre"
    t.integer "area"
    t.float "presupuesto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "roles", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.boolean "activo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "alcaldias", "municipios"
  add_foreign_key "empleados", "alcaldias"
  add_foreign_key "empleados", "personas"
  add_foreign_key "empleados", "roles", column: "rol_id"
  add_foreign_key "personas", "viviendas"
  add_foreign_key "propietarios", "personas"
  add_foreign_key "propietarios", "viviendas"
  add_foreign_key "viviendas", "municipios"
end
