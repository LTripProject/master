class RenamePhotoToPhotosFromTrips < ActiveRecord::Migration[5.1]
  def change
    rename_column :trips, :photo, :photos
  end
end
