class RenameColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :schedule_details, :schedules_id, :schedule_id
  end
end
