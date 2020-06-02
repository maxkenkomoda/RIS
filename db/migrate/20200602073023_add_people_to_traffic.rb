class AddPeopleToTraffic < ActiveRecord::Migration[5.2]
  def change
    add_column :traffics, :people, :boolean, default: false, null: false
  end
end
