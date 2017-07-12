module ApplicationHelper
  def current_user_id
    session[:user_id]
  end

  def set_current_trip(trip_id)
    session[:current_trip] = trip_id
  end
  def current_trip
    session[:current_trip]
  end

  def clear_user_id
    session[:user_id] = nil
  end
  
end
