class CreateValores < ActiveRecord::Migration[5.0]
  def change
    create_table :valores do |t|

      t.belongs_to :subvenciones, foreign_key: true
      t.belongs_to :grados, foreign_key: true
      t.integer    :precio
      t.timestamps
    end
  end
end
