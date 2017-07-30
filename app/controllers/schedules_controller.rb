class SchedulesController < ApplicationController
	def index
		@trip = Trip.find(params[:trip_id])
		@schedules = @trip.schedules
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

	def edit
		@trip = Trip.find(params[:trip_id])
		@schedule = Schedule.find(params[:id])
	end

	def update
		
	end

	def show
		@schedule = Schedule.find(params[:id])
		@data = GoogleApiClient.search_address("Ho Chi Minh")
	end

	def schedule_params
		params.require(:schedule).permit(:title, :schedule_details_attributes => [:hour_spend, :_destroy])
	end
end
