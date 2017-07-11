class CreateUserBudgets < ActiveRecord::Migration
  def change
    create_table :user_budgets do |t|
      t.references :budget_item, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :price

      t.timestamps null: false
    end
  end
end
