class CreateSubvenciones < ActiveRecord::Migration[5.0]
  def change
    create_table :subvenciones do |t|

      t.string :tipo
      t.string :sigla

      t.timestamps
    end
  end
end
