class AddLatitudesToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :latitudes, :float
  end
end
