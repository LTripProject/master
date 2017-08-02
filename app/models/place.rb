class Place < ApplicationRecord
  belongs_to :region
  has_many :photos, dependent: :destroy

  def map_url
    GoogleApiClient.get_map_frame(self.location_id)
  end

  def relative_places
    Place.where(region: self.region).where.not(id: self.id)
  end

  def display_image_url(height = nil)
    if self.photos.first
      @photo = self.photos.first
      @photo.image_url(height)
    else
      'https://www.mariecuriealumni.eu/sites/default/files/styles/50x50_avatar/public/pictures/picture-default.jpg?itok=uk4ugbrt'
    end
  end
end
