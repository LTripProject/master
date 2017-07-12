class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.integer :index, index: true
      t.references :trip, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
