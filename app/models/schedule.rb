class Schedule < ApplicationRecord
  belongs_to :trip
  has_many :schedule_details, -> { order(:index) }, dependent: :destroy
  has_many :places, through: :attractions
  has_one :budget_trip, dependent: :destroy
end
