class CreateCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :cursos do |t|

      t.string :letra
      t.integer :cantidad_alumnos
      t.integer :inasistencias

      t.belongs_to :grados, foreign_key: true
      t.timestamps
    end
  end
end
