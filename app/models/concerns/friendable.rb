module Concerns
  module Friendable
    extend ActiveSupport::Concern

    included do
      has_many :relations, dependent: :destroy

      has_many :friends,
                -> { where relations: { status: 'accepted' } },
                through: :relations,
                source: :friend
    end
  end
end