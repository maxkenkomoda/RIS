class RemoveTitleFromMaps < ActiveRecord::Migration[5.2]
  def change
    remove_column :maps, :title, :string
  end
end
