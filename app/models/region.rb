class Region < ApplicationRecord
  has_many :places, dependent: :destroy

  def self.get_regions
    Region.where(id: Trip.all.collect(&:departure_id))
  end

  def self.list_of_region(name)
    Region.where(id: Place.list_of_places_by_departure(name).pluck(:region_id).uniq)
  end

  validates_presence_of :name
end
