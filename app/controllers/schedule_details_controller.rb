class ScheduleDetailsController < ApplicationController
	
  before_action :require_login
  before_action :get_schedule, only: [:destroy, :create]

  def show
		
  end

  def create
    @schedule_details = Schedule.find(@params[:schedule_id]).schedule_details
	schedule_details = @schedule_details.new(schedule_detail_params)
    schedule_details.index = @schedule_details.count + 1
    if schedule_details.save
      calculate_distance(schedule_details)
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
