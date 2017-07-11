class BudgetTrip < ApplicationRecord
    belongs_to :schedule
    belongs_to :trip
    has_many :budget, dependent: :destroy
end
