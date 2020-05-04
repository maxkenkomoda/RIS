class AddLongitudeToMaps < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :longitude, :decimal, precision: 11, scale: 8
  end
end
