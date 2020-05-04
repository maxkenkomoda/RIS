class RemoveLongitudeFromMaps < ActiveRecord::Migration[5.2]
  def change
    remove_column :maps, :longitude, :decimal
  end
end
