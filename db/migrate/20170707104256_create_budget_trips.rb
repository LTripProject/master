class CreateBudgetTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :budget_trips do |t|
      t.references :schedule_detail, index: true, foreign_key: true
      t.references :trip, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
      t.timestamps
    end
  end
end
