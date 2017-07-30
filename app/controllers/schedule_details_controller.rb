class ScheduleDetailsController < ApplicationController
	
  before_action :get_schedule, only: [:destroy, :create]

  def show
		
  end

  def title
    schedule_detail.place.name
  end

  def create
    get_attractions
    create_attraction
    
    respond_to :js
  end

  def image_url
  end

  
  def destroy
    puts params[:id]
     @attraction = ScheduleDetail.find(params[:id])
     @schedule_day.schedule_details.each do |attraction|
        attraction.decrement!(:index, by = 1) if attraction.index > @attraction.index
      end
    respond_to :js
  end

  private
  def get_schedule
    @schedule_day = Schedule.find(params[:schedule_id])
  end

  def get_attractions
    @attractions = Schedule.find(@params[:schedule_id]).schedule_details
  end

  def create_attraction
    attraction = @attractions.new(schedule_detail_params)
    attraction.index = @attractions.count + 1
    if attraction.save
      calculate_distance(attraction)
    end
  end

  def calculate_distance(schedule_details)
    last_attraction = @attractions.find_by(index: schedule_details.index - 1)
  end

  def schedule_detail_params
    params.require(:schedule_detail).permit(:place_id, :hour_spend)
  end
end
