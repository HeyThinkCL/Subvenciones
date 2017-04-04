class CreateProfesores < ActiveRecord::Migration[5.0]
  def change
    create_table :profesores do |t|
      t.string :dv
      t.integer :rut
      t.string :nombres
      t.string :apellidos
      t.integer :horas
      t.integer :remuneracion


      t.timestamps
    end
  end
end
