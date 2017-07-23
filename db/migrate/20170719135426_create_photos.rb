class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :place, index: true
      t.string :photo_reference
      t.integer :height
      t.integer :width
      t.timestamps
    end
  end
end
