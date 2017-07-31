class ScheduleDetail < ApplicationRecord
  belongs_to :schedule, optional: true
  belongs_to :place, optional: true

  validates_presence_of :place_id, :schedule_id, :index
  validates_numericality_of :hour_spend
  DEFAULT_PHOTO = 'https://media-cdn.tripadvisor.com/media/photo-o/05/c5/a3/bf/tropica-island-resort.jpg'
  
  def image_url(height = nil)
    puts "#{self.place.photos}"
  end


end
