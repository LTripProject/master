class Relation < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User", foreign_key: :target_id

  validates :user_id, :target_id, presence: true
end
