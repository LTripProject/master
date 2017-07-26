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
<<<<<<< HEAD
		@data = GoogleApiClient.search_address("Ho Chi Minh")
		puts @data
=======
>>>>>>> 077d99894147bb9f13d5d7da8ea64d80da68e79a
	end

	def schedule_params
		params.require(:schedule).permit(:title, :schedule_details_attributes => [:hour_spend, :_destroy])
	end
end
