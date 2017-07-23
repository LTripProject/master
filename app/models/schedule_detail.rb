class ScheduleDetail < ApplicationRecord
  belongs_to :schedule, optional: true
  belongs_to :place, optional: true
end
