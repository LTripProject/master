class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.datetime :start_date
      t.integer :departure_id, index: true
      t.string :title
      t.text :description
      t.decimal :expected_budget
      
      t.timestamps
    end
  end
end
