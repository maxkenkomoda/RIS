class AddSpeedToTraffic < ActiveRecord::Migration[5.2]
  def change
    add_column :traffics, :speed, :boolean, default: false, null: false
    add_column :traffics, :large_car, :boolean, default: false, null: false
  end
end
