class Photo < ApplicationRecord
  belongs_to :trip, optional: true

  belongs_to :place
  mount_uploader :image, PhotoUploader

  validates_presence_of :height, :width, :place_id, :photo_reference

  def image_url(height = nil)
    image_height = height ? height : self.height
    GoogleApiClient.get_place_photo(self.photo_reference, image_height)
  end
end
