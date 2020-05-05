class AddTitleToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :title, :text
  end
end
