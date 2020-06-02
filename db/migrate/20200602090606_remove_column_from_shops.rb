class RemoveColumnFromShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :no_shop, :boolean
    remove_column :shops, :no_vending_machine, :boolean
  end
end
