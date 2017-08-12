class Trip < ApplicationRecord
  
  has_many :user_trips, dependent: :destroy
  has_many :users, through: :user_trips
  has_many :schedules, dependent: :destroy
  has_many :schedule_details, through: :schedules
  has_many :places, through: :schedule_details
  has_many :regions, through: :places
  has_many :invite_tokens, dependent: :destroy
  # has_many :photos, dependent: :destroy
  belongs_to :departure, class_name: "Region", foreign_key: :departure_id, optional: true
  has_one :budget_trip, dependent: :destroy

  # scope :public_trips, ->{where(status: true)}
  scope :availabe_trips, -> {where("start_date >= ? AND status = true", Time.now)}

  # enum status: {public: true, private: false}

  # accepts_nested_attributes_for :photos, :reject_if => :all_blank

  validates_presence_of :title, :departure_id, :expected_budget
  validates_numericality_of :expected_budget

  after_create :create_default  

  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON
  DEFAULT_PHOTO = 'https://media-cdn.tripadvisor.com/media/photo-o/05/c5/a3/bf/tropica-island-resort.jpg'
  DEFAULT_IMAGE = 'http://amazingdanang.com/wp-content/uploads/2015/04/8693738209_1ba2034976_k.jpg'

  def self.search_trips(departure, destination, start_date)
    @departure = Region.find_by(name: departure)
    @destination = Region.find_by(name: destination)

    if @departure != nil && @destination == nil
      Trip.where(departure_id: @departure.id)
    end
  end

  def display_photo
    photos.empty? ? DEFAULT_PHOTO : photos.first.url
  end

  def trip_image
    photos.empty? ? DEFAULT_IMAGE : photos.first.url
  end

  def create_default
    self.schedules.create(index: 1)
    self.create_budget_trip
  end

  def relative_trips
    Trip.where(departure: self.departure).where.not(id: self.id)
  end

  def self.trips_start_at_departure(name)
    Trip.where(departure_id: Region.find_by(name: name).id).uniq
  end
end
