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


  def calculate_distance(current_schedule_detail, schedule_detail)
    current_place, place = current_schedule_detail.place, schedule_detail.place
    response = GoogleApiClient.calculate_distance(
        current_schedule_detail.latitude,
        current_schedule_detail.longitude,
        schedule_detail.latitude,
        schedule_detail.longitude
    )
    schedule_detail.update_attributes(
        distance: response['distance']['text'],
        duration: response['duration']['text']
    )
  end

  private
  def get_attrations(schedule_id)
    @attractions = Schedule.find(schedule_id).attractions.preload(:place)
  end

  def calculate_attractions_distance
    ScheduleDetail.transaction do
      current_attraction = @attractions.first
      @attractions.drop(0).each do |attraction|
        calculate_distance(current_attraction, attraction)
        current_attraction = attraction
      end
    end
  end

  def process?
    !@attractions.blank? && @attractions.pluck(:index) == (1..@attractions.count).to_a
  end

  def schedule_detail_params
    params.require(:schedule_detail).permit(:place_id, :hour_spend)
  end
end
