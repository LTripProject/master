class User < ApplicationRecord
  has_many :user_trips
  has_many :trips, through: :user_trips
end
