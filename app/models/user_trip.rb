class UserTrip < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :trip,  optional: true, counter_cache: true

  validates_presence_of :user_id, :trip_id
  validates_uniqueness_of :user_id, scope: :trip_id
end
