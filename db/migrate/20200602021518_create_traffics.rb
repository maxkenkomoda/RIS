class CreateTraffics < ActiveRecord::Migration[5.2]
  def change
    create_table :traffics do |t|
      t.references :map, foreign_key: true
      t.boolean :volume, default: false, null: false

      t.timestamps
    end
  end
end
