class Relation < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User", foreign_key: :target_id

  validates :user_id, :friend_id, presence: true
end
