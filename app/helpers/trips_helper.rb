module TripsHelper
  def set_current_trip(trip)
    session[:trip_id] = trip.id
  end
end
