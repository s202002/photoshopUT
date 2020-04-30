class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :explain
      t.string :image_id
      t.string :title
      t.integer :customer_id
      t.text :place
      t.string :tag

      t.timestamps
    end
  end
end
