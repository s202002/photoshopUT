class RemoveLatitudesFromPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :latitudes, :float
  end
end
