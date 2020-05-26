class RemovePostFromMaps < ActiveRecord::Migration[5.2]
  def change
    remove_column :maps, :post_id
  end
end
