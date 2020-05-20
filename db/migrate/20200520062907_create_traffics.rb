class CreateTraffics < ActiveRecord::Migration[5.2]
  def change
    create_table :traffics do |t|
      t.boolean :volume
      t.references :user, foreign_key: true
      t.references :map, foreign_key: true

      t.timestamps
    end
  end
end
