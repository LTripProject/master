class ScheduleDetail < ApplicationRecord
  belongs_to :schedule, optional: true
  
  belongs_to :place, optional: true

  validates_presence_of :place_id, :schedule_id, :index
  validates_numericality_of :hour_spend
end
