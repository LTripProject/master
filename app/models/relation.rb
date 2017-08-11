class Relation < ApplicationRecord
  belongs_to :user
  has_one :tartget, class_name: User, foreign_key: :id

end
