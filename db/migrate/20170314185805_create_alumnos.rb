class CreateAlumnos < ActiveRecord::Migration[5.0]
  def change
    create_table :alumnos do |t|
      t.integer :alumnos
      t.integer :asistencias
      t.integer :inasistencias
      t.belongs_to :subvenciones, foreign_key: true
      t.belongs_to :cursos, foreign_key: true

      t.timestamps
    end
  end
end
