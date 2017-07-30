class BudgetTrip < ApplicationRecord
    belongs_to :schedule, optional: true
    belongs_to :trip
    validate :check_expected_budget

    has_many :budgets, dependent: :destroy
    accepts_nested_attributes_for :budgets, :reject_if => :all_blank

    def total_cost
      self.budgets.map(&:price).sum
    end

    private
      def check_expected_budget
        if self.total_cost > self.trip.expected_budget
          errors.add(:budgets, "Out of expected budget") 
        end
      end
end
