class AddColumnToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :no_shop, :boolean, default: false, null: false
    add_column :shops, :no_vending_machine, :boolean, default: false, null: false
  end
end
