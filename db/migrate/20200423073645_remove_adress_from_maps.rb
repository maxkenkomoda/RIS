class RemoveAdressFromMaps < ActiveRecord::Migration[5.2]
  def change
    remove_column :maps, :adress, :string
  end
end
