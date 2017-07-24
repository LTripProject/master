class Trip < ApplicationRecord
  
  has_many :user_trips, dependent: :destroy
  has_many :users, through: :user_trips
  has_many :schedules, dependent: :destroy
  has_many :schedule_details, through: :schedules
  has_many :places, through: :schedule_detail
  belongs_to :departure, class_name: Region, foreign_key: :departure_id
  has_many :photos
  validates_presence_of :title
  validates_numericality_of :expected_budget

  DEFAULT_PHOTO = 'https://media-cdn.tripadvisor.com/media/photo-o/05/c5/a3/bf/tropica-island-resort.jpg'

  def self.search_trips(departure, destination, start_date)
    @departure = Region.find_by(name: departure)
    @destination = Region.find_by(name: destination)
    if @departure != nil && @destination == nil
      Trip.where(departure_id: @departure.id)
    end

    if start_date != nil
      Trip.where("DATE(created_at) <= ?" , start_date)
    end
  end

  def display_photo
    photos.empty? ? DEFAULT_PHOTO : photos.first
  end
end
