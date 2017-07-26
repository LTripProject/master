class Schedule < ApplicationRecord
  belongs_to :trip
  has_many :schedule_details, -> { order(:index) }, dependent: :destroy, inverse_of: :schedule
  has_many :places, through: :schedule_details
  has_one :budget_trip, dependent: :destroy

  accepts_nested_attributes_for :schedule_details, :reject_if => :all_blank
end
