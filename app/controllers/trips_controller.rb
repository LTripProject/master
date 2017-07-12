class TripsController < ApplicationController
    before_action :require_login, except: [:show]


  def show
    unless @trip.user_ids.include?(current_user_id)
      
    end
  end

  def edit
    if @trip.id != current_trip
      set_current_trip(@trip.id)
    end
  end 

  def create
    @trip = Trip.new(trip_params)
    @created = @trip.save
    @trip.user_trips.create(user_id: current_user_id) if @created
  end

  def update
    @trip.departure = Region.find_by(name: params[:trip][:departure])
    @updated = @trip.update_attributes(trip_update_params)
  end

  def trip_params
    params.require(:trip).permit(:title, :expected_budget)
  end
end
