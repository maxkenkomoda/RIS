class RemoveLatitudeFromMaps < ActiveRecord::Migration[5.2]
  def change
    remove_column :maps, :latitude, :decimal
  end
end
