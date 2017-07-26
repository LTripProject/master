class BudgetTrip < ApplicationRecord
    belongs_to :schedule, optional: true
    belongs_to :trip

    has_many :budgets, dependent: :destroy
    accepts_nested_attributes_for :budgets, :reject_if => :all_blank
end
