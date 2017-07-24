class InviteToken < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  before_save :generate_token

  validates :user_id, :trip_id, presence: true
  private
    def generate_token
      self.token ||= SecureRandom.base64(64) if self.new_record?
    end
end
