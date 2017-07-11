class ScheduleDetail < ApplicationRecord
  belongs_to :schedule
  belongs_to :place
end
