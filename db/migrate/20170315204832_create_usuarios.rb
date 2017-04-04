class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|

      t.integer :rut
      t.string  :dv
      t.string  :nombre
      t.string  :apellido
      t.string  :email

      t.belongs_to :colegio


      t.timestamps
    end
  end
end
