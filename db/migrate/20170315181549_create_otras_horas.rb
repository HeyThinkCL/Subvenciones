class CreateOtrasHoras < ActiveRecord::Migration[5.0]
  def change
    create_table :otras_horas do |t|

      t.string     :nombre
      t.integer    :horas
      t.belongs_to :profesores, foreign_key: true
      t.belongs_to :asignaturas, foreign_key: true

      t.timestamps
    end
  end
end
