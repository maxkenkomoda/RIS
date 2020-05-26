class AddMapToTitle < ActiveRecord::Migration[5.2]
  def change
    add_reference :titles, :map, foreign_key: true
  end
end
