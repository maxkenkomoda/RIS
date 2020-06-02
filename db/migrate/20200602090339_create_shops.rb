class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.references :map, foreign_key: true
      t.boolean :no_shop
      t.boolean :no_vending_machine

      t.timestamps
    end
  end
end
