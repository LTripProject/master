class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_trips
  has_many :trips, through: :user_trips

  def send_invite_mail(user, trip)
    TripMailer.trip_invitation(self, user, trip).deliver_now
  end
end
