class ChangePostsToTitles < ActiveRecord::Migration[5.2]
  def change
    rename_table :posts, :titles
  end
end
