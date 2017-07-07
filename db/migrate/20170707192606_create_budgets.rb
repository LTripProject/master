class CreateBudgets < ActiveRecord::Migration[5.1]
  def change
    create_table :budgets do |t|

      t.timestamps
    end
  end
end
