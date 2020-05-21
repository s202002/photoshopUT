class AddLatitudeToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :latitude, :float
  end
end
