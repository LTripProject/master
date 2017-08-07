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
      last_attraction = @attractions.find_by(index:  @attraction.index - 1)
      calculate_distances if last_attraction
      
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


  def calculate_distance(current_schedule_detail, schedule_detail, weathers)
    
    weather =  weathers["list"][0]
    puts weather['temp']
    puts weather['temp']['morn']
   
    current_place, place = current_schedule_detail.place, schedule_detail.place
    response = GoogleApiClient.calculate_distance(
        current_place.latitude,
        current_place.longitude,
        place.latitude,
        place.longitude
    )
    schedule_detail.update_attributes(
        distance: response['distance']['text'],
        duration: response['duration']['text'],
        tempday: weather['temp']['morn'],
        tempeve: weather['temp']['eve'],
        tempnight: weather['temp']['night'],
        tempmain: weather['weather'][0]['main'],
        tempdesc: weather['weather'][0]['description']
    )
  end

  def get_attrations(schedule_id)
    @attractions = Schedule.find(schedule_id).schedule_details.preload(:place)
  end

  def calculate_distances
    ScheduleDetail.transaction do
      current_attraction = @attractions.first
      @attractions.drop(0).each do |attraction|
        @weather = GoogleApiClient.get_weather_forecast(attraction.place.latitude, attraction.place.longitude)
        calculate_distance(current_attraction, attraction , @weather)
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
