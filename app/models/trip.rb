class Trip < ApplicationRecord
  
  has_many :user_trips, dependent: :destroy
  has_many :users, through: :user_trips
  has_many :schedules, dependent: :destroy
  has_many :schedule_details, through: :schedules
  has_many :places, through: :schedule_detail
  has_many :invite_tokens, dependent: :destroy
  belongs_to :departure, class_name: "Region", foreign_key: :departure_id, optional: true

  validates_presence_of :title
  validates_numericality_of :expected_budget

  def self.search(departure, destination)
    @departure = Region.find_by(name: departure)
    @destination = Region.find_by(name: destination)
    if @departure != nil && @destination == nil
      Trip.where(departure_id: @departure.id, is_published: true)
    end
  end

  def display_photo
    photos.empty? ? DEFAULT_PHOTO : photos.first
  end
end
