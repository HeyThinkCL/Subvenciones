class CreateGrados < ActiveRecord::Migration[5.0]
  def change
    create_table :grados do |t|

      t.integer :nivel
      t.string :grado
      t.string :estado
      t.timestamps
    end
  end
end
