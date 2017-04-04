class CreateInhabiles < ActiveRecord::Migration[5.0]
  def change
    create_table :inhabiles do |t|

      t.timestamps
    end
  end
end
