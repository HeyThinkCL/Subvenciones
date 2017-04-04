class CreateHoras < ActiveRecord::Migration[5.0]
  def change
    create_table :horas do |t|
      t.belongs_to :cursos, foreign_key: true
      t.belongs_to :profesores, foreign_key: true
      t.belongs_to :asignaturas, foreign_key: true
      t.integer :horas
      t.timestamps
    end
  end
end
