class AddWeatherToScheduleDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :schedule_details, :tempday, :string
    add_column :schedule_details, :tempeve, :string
    add_column :schedule_details, :tempnight, :string
    add_column :schedule_details, :tempmain, :string
    add_column :schedule_details, :tempdesc, :string
  end
end
