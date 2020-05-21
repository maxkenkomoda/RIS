class DropTraffic < ActiveRecord::Migration[5.2]
  def change
    drop_table :traffics
  end
end
