class AddTagToPhotos < ActiveRecord::Migration[5.2]
  def change
    change_column :photos, :tag, :text
  end
end
