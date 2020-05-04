class AddLatitudeToMaps < ActiveRecord::Migration[5.2]
  def change
    add_column :maps, :latitude, :decimal, precision: 11, scale: 8 
  end
end
