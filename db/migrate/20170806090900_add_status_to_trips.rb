class AddStatusToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :status, :boolean, default: true
  end
end
