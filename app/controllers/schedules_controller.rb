class SchedulesController < ApplicationController
	def new
		@trip = Trip.find(:trip_id)
		
	end

	def create
		@trip = Trip.find(:trip_id)
		@schedule = @trip.build(schedule_params)
		if @schedule.save 
			flash[:notice] = 'The schedule is successfully saved!'
		end
		
	end

	def
		schedule_params.require(:schedule).permit(:title)
	end
end
