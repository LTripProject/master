class AddTripIdToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :trip, foreign_key: true
  end
end
