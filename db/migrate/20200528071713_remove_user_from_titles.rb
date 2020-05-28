class RemoveUserFromTitles < ActiveRecord::Migration[5.2]
  def change
    remove_column :titles, :user_id
  end
end
