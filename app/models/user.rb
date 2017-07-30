class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]


  has_many :user_trips, dependent: :destroy
  has_many :trips, through: :user_trips
  has_many :invite_tokens, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.frienly_token[0,20]
      user.provider = auth.provider
      user.uid = auth.uid
    end
  end

  def send_invite_mail(user, trip)
    TripMailer.trip_invitation(self, user, trip, user.invite_token(trip))
      .deliver_now
  end

  def check_valid_token?(trip, invite_token)
    self.invite_tokens.where(trip: trip).last.token == invite_token
  end

  def invite_token(trip)
    unless self.invite_tokens.where(trip: trip).any?
      self.invite_tokens.create(user: self, trip: trip)
    end

    self.invite_tokens.where(trip: trip).last.token
  end
end
