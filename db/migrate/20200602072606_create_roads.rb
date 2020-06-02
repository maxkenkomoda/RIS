class CreateRoads < ActiveRecord::Migration[5.2]
  def change
    create_table :roads do |t|
      t.references :map, foreign_key: true
      t.boolean :condition, default: false, null: false
      t.boolean :sidewalk, default: false, null: false
      t.boolean :narrow, default: false, null: false

      t.timestamps
    end
  end
end
