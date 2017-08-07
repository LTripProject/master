class AddDistanceToScheduleDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :schedule_details, :distance, :string
    add_column :schedule_details, :duration, :string
  end
end
