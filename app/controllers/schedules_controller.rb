class SchedulesController < ApplicationController
	before_action :get_trip, only: [:index, :new,:create, :destroy]
	before_action :get_schedule_day, only: [:sort, :destroy]

	def index
		@schedules = @trip.schedules
		@places = Place.all.preload(:region)
	end

	def new
		@schedule = @trip.schedules.build
		@schedule.schedule_details.build
	end

	def places
		@place = Place.all
	end

	def create
		@schedule = @trip.schedules.create(index: next_index)
		@place = Place.all
		respond_to :js
	end

	def destroy
		Schedule.transaction do
		@trip.schedules.each do |day|
			day.decrement!(:index, by = 1) if day.index > @schedule.index
		end
		@schedule.destroy
		end
		prepare_data
		respond_to :js
	end

	def sort
		respond_to :js
  	end


	def show
		@schedule = Schedule.find(params[:id])
	end

	def update
		
	end

	def show
		@schedule = Schedule.find(params[:id])
		@data = GoogleApiClient.search_address("Ho Chi Minh")
	end

	private
	def get_trip
		@trip = Trip.find(params[:trip_id])
	end

	def next_index
		@trip.schedules.count + 1
	end

	def get_schedule_day
		@schedule = Schedule.find(params[:id])
	end

	def prepare_data
		@schedule = @trip.schedules.last
		@schedules = @trip.schedules
		@places = Place.all.preload(:region)
	end
end
