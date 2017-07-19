class SchedulesController < ApplicationController
	def new
		@trip = Trip.find(params[:trip_id])
		@schedule = Schedule.new
		@schedule.schedule_details.build
	end

	def create
		@trip = Trip.find(params[:trip_id])
		@schedule = @trip.schedules.build(schedule_params)
		if @schedule.save 
			flash[:notice] = 'The schedule is saved successfully!'
		end

	end

	def edit
		
	end

	def schedule_params
		params.require(:schedule).permit(:title)
	end
end
