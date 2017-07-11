class CreateScheduleDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_details do |t|
     
      t.references :schedules, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true
      t.integer :index, index: true
      t.decimal :hour_spend, default: 1

      t.timestamps null: false
      t.timestamps
    end
  end
end
