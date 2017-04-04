class CreateSostenedores < ActiveRecord::Migration[5.0]
  def change
    create_table :sostenedores do |t|

      t.timestamps
    end
  end
end
