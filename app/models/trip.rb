class Trip < ApplicationRecord
  
  has_many :user_trips, dependent: :destroy
  has_many :users, through: :user_trips
  has_many :schedule, dependent: :destroy
  has_many :schedule_detail, through: :schedule
  has_many :places, through: :schedule_detail
end
