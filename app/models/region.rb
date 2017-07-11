class Region < ApplicationRecord
  has_many :places, dependent: :destroy

  validates_presence_of :name, :latitude, :longitude
end
