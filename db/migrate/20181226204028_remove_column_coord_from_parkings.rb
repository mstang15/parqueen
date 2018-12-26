class RemoveColumnCoordFromParkings < ActiveRecord::Migration[5.2]
  def change
    remove_column :parkings, :coord
  end
end
