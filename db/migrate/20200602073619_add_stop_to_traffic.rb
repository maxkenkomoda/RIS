class AddStopToTraffic < ActiveRecord::Migration[5.2]
  def change
    add_column :traffics, :stop, :boolean, default: false, null: false
  end
end
