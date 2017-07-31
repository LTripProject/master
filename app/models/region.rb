class Region < ApplicationRecord
  has_many :places, dependent: :destroy

  def self.get_regions
    Region.where(id: Trip.all.collect(&:departure_id))
  end

  validates_presence_of :name
end
