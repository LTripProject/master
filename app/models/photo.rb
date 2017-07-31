class Photo < ApplicationRecord
  belongs_to :trip, optional: true

  belongs_to :place, optional: true

  mount_uploader :image, PhotoUploader
end
