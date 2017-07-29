class ScheduleDetailsController < ApplicationController
	
  before_action :get_schedule, only: [:destroy, :create]

  def show
		
  end

  def title
    schedule_detail.place.name
  end

  def create

    @attractions = Schedule.find(@params[:schedule_id]).schedule_details
    attraction = @attractions.new(attraction_params)
    attraction.index = @attractions.count + 1
    if attraction.save
      attraction.decorate
    end
    respond_to :js
  end

  
  def destroy
    respond_to :js
  end

  private
  def get_schedule
    @schedule_day = Schedule.find(params[:schedule_id])
  end


  def calculate_distance(schedule_details)
  end

  def schedule_detail_params
    @params.require(:schedule_detail).permit(:place_id, :hour_spend)
  end
end
