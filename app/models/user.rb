class User < ApplicationRecord
  include Concerns::Friendable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  has_many :user_trips, dependent: :destroy
  has_many :trips, through: :user_trips
  has_many :invite_tokens, dependent: :destroy
  has_many :user_notifications
  has_many :notifications, through: :user_notifications, class_name: 'Notification', source: :notification
  mount_uploader :image, PhotoUploader

  DEFAULT_AVATAR = "https://www.infrascan.net/demo/assets/img/avatar5.png"

  def notifications_with_senders
    self.user_notifications.preload(:notification, :sender)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name   # assuming the user model has a name
      user.facebook_avatar = auth.info.image
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

  def image_url
    photo = self.provider.present? ? self.facebook_avatar : self.image.url
    photo ||= DEFAULT_AVATAR
  end

  def show_name
    self.name.present? ? self.name : self.email
  end

  def self.list_friend(current_user, search_data)
    where.not(id: Relation.where(user: current_user).pluck(:target_id)).where.not(id: current_user.id)
        .where("name like ? OR email like ?", "%#{search_data}%", "%#{search_data}%").order(:name)
  end

  def public_trips
    self.trips.where(status: true)
  end
end
 