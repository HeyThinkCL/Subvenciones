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

ActiveRecord::Schema.define(version: 20170315204950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alumnos", force: :cascade do |t|
    t.integer  "alumnos"
    t.integer  "asistencias"
    t.integer  "inasistencias"
    t.integer  "subvenciones_id"
    t.integer  "cursos_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["cursos_id"], name: "index_alumnos_on_cursos_id", using: :btree
    t.index ["subvenciones_id"], name: "index_alumnos_on_subvenciones_id", using: :btree
  end

  create_table "asignaturas", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colegios", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cursos", force: :cascade do |t|
    t.string   "letra"
    t.integer  "cantidad_alumnos"
    t.integer  "inasistencias"
    t.integer  "grados_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["grados_id"], name: "index_cursos_on_grados_id", using: :btree
  end

  create_table "cursos_otras_horas", id: false, force: :cascade do |t|
    t.integer "otras_hora_id",  null: false
    t.integer "curso_id",       null: false
    t.integer "cursos_id"
    t.integer "otras_horas_id"
    t.index ["cursos_id"], name: "index_cursos_otras_horas_on_cursos_id", using: :btree
    t.index ["otras_horas_id"], name: "index_cursos_otras_horas_on_otras_horas_id", using: :btree
  end

  create_table "grados", force: :cascade do |t|
    t.integer  "nivel"
    t.string   "grado"
    t.string   "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horas", force: :cascade do |t|
    t.integer  "cursos_id"
    t.integer  "profesores_id"
    t.integer  "asignaturas_id"
    t.integer  "horas"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["asignaturas_id"], name: "index_horas_on_asignaturas_id", using: :btree
    t.index ["cursos_id"], name: "index_horas_on_cursos_id", using: :btree
    t.index ["profesores_id"], name: "index_horas_on_profesores_id", using: :btree
  end

  create_table "inhabiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "otras_horas", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "horas"
    t.integer  "profesores_id"
    t.integer  "asignaturas_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["asignaturas_id"], name: "index_otras_horas_on_asignaturas_id", using: :btree
    t.index ["profesores_id"], name: "index_otras_horas_on_profesores_id", using: :btree
  end

  create_table "profesores", force: :cascade do |t|
    t.string   "dv"
    t.integer  "rut"
    t.string   "nombres"
    t.string   "apellidos"
    t.integer  "horas"
    t.integer  "remuneracion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sostenedores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subvenciones", force: :cascade do |t|
    t.string   "tipo"
    t.string   "sigla"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.integer  "rut"
    t.string   "dv"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.string   "passwd"
    t.integer  "colegio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["colegio_id"], name: "index_usuarios_on_colegio_id", using: :btree
  end

  create_table "valores", force: :cascade do |t|
    t.integer  "subvenciones_id"
    t.integer  "grados_id"
    t.integer  "precio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["grados_id"], name: "index_valores_on_grados_id", using: :btree
    t.index ["subvenciones_id"], name: "index_valores_on_subvenciones_id", using: :btree
  end

  add_foreign_key "alumnos", "cursos", column: "cursos_id"
  add_foreign_key "alumnos", "subvenciones", column: "subvenciones_id"
  add_foreign_key "cursos", "grados", column: "grados_id"
  add_foreign_key "cursos_otras_horas", "cursos", column: "cursos_id"
  add_foreign_key "cursos_otras_horas", "otras_horas", column: "otras_horas_id"
  add_foreign_key "horas", "asignaturas", column: "asignaturas_id"
  add_foreign_key "horas", "cursos", column: "cursos_id"
  add_foreign_key "horas", "profesores", column: "profesores_id"
  add_foreign_key "otras_horas", "asignaturas", column: "asignaturas_id"
  add_foreign_key "otras_horas", "profesores", column: "profesores_id"
  add_foreign_key "valores", "grados", column: "grados_id"
  add_foreign_key "valores", "subvenciones", column: "subvenciones_id"
end
