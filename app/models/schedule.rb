class Schedule < ApplicationRecord
  belongs_to :trip
  has_many :schedule_details, -> { order(:index) }, dependent: :destroy, inverse_of: :schedule
  has_many :places, through: :schedule_details

  accepts_nested_attributes_for :schedule_details, :reject_if => :all_blank

  DEFAULT_LAT_AVG = 14.0583
  DEFAULT_LNG_AVG = 108.2772

  def check
    average_latitude = self.places.size > 0 ? self.places.map(&:latitude).reduce(&:+) / self.places.size : DEFAULT_LAT_AVG
    average_longitude = self.places.size > 0 ? self.places.map(&:longitude).reduce(&:+) / self.places.size : DEFAULT_LNG_AVG
    {latitude: average_latitude, longitude: average_longitude}
  end

  def pairs_of_schedule_details
    count = self.schedule_details.size
    count >= 2 ? self.schedule_details[0..count-2].zip(self.schedule_details[1..count-1]) : []
  end

  def self.list_of_schedule_day_by_departure(name)
    Schedule.where(trip_id: Trip.trips_start_at_departure(name).pluck(:id))
  end
end
