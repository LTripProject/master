class AddTripIdToBudgets < ActiveRecord::Migration[5.1]
  def change
    add_reference :budgets, :trip, foreign_key: true
  end
end
