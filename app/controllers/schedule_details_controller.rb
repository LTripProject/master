class ScheduleDetailsController < ApplicationController
	
  before_action :get_schedule, only: [:destroy, :create]

  def show
		
  end

  def title
    schedule_detail.place.name
  end

  def create
    @attractions = Schedule.find(params[:schedule_id]).schedule_details
    @attraction = @attractions.new(schedule_detail_params)
    @attraction.index = @attractions.count + 1
    if @attraction.save
      respond_to :js
    end
    
  end

  def image_url
  end

  
  def destroy
     @schedule = ScheduleDetail.find(params[:id]).schedule
     @attraction = ScheduleDetail.find(params[:id]).destroy
     
    respond_to :js
  end

  private
  def get_schedule
    @schedule_day = Schedule.find(params[:schedule_id])
  end


  def calculate_distance(schedule_details)
    
  end

  def schedule_detail_params
    params.require(:schedule_detail).permit(:place_id, :hour_spend)
  end
end
