class AddUserTripCouterCache < ActiveRecord::Migration[5.1]
  def up
    add_column :trips, :user_trips_count, :integer, default: 0

    Trip.reset_column_information
    Trip.all.each do |trip|
      Trip.update_counters trip.id, user_trips_count: trip.user_trips.length
    end
  end

  def down
    remove_column :trips, :user_trips_count
  end
end
