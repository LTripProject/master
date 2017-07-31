class Place < ApplicationRecord
    belongs_to :region
    has_many :photos, dependent: :destroy
    
    def map_url
        GoogleApiClient.get_map_frame(self.location_id)
    end
end
