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
            'http://www.brother.in/AP/Handlers/ApHandler.ashx?m=rs&guid=&pr=100'
        end
    end
  end
end
