class Photo < ApplicationRecord
  belongs_to :place

  validates_presence_of :place_id, :photo_reference
end
