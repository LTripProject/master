class SchedulesController < ApplicationController
	before_action :set_trip

	def index
		@schedule = @trip.schedules.build
	end

	def new
		@schedule = @trip.schedules.build
		@schedule.schedule_details.build
	end

	def create
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

	private
		def set_trip
			@trip = Trip.find(params[:trip_id])
		end

		def schedule_params
			params.require(:schedule).permit(:title, :schedule_details_attributes => [:hour_spend, :_destroy])
		end
end
