class SchedulesController < ApplicationController
	def index
		@trip = Trip.find(params[:trip_id])
		@schedule = @trip.schedules.build
	end

	def new
		@trip = Trip.find(params[:trip_id])
		@schedule = @trip.schedules.build
		@schedule.schedule_details.build
	end

	def create
		@trip = Trip.find(params[:trip_id])
		@schedule = @trip.schedules.build(schedule_params)
		if @schedule.save 
			flash[:notice] = 'The schedule is saved successfully!'
			redirect_to [@trip, @schedule]
		else
			flash[:error] = 'Cannot save the schedule!'
			render :new
		end
	end

	def show
		@schedule = Schedule.find(params[:id])

	end

	def schedule_params
		params.require(:schedule).permit(:title, :schedule_details_attributes => [:hour_spend, :_destroy])
	end
end
