class RenameContentColumnToMaps < ActiveRecord::Migration[5.2]
  def change
    rename_column :maps, :content, :title
  end
end
