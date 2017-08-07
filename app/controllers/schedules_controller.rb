class SchedulesController < ApplicationController
	before_action :get_trip, only: [:index, :new,:create, :destroy]
	before_action :get_schedule_day, only: [:sort, :destroy]

	def index
		@schedules = @trip.schedules
		@places = Place.all.preload(:region).decorate
	end

	def new
		@places = Place.all.preload(:region).decorate
		@schedule = @trip.schedules.build
		@schedule.schedule_details.build
	end

	def places
		@places = Place.all.preload(:region).decorate
	end

	def create
		@schedule = @trip.schedules.create(index: next_index)
		@places = Place.all.preload(:region).decorate
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
		@attractions = Schedule.find(params[:id]).schedule_details
		@schedule_day_id = params[:id]
		@indexes = params[:indexes].map(&:to_i)
		sort_attractions
        calculate_distances

		respond_to :js
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

	def calculate_distance(current_schedule_detail, schedule_detail)
		current_place, place = current_schedule_detail.place, schedule_detail.place
		response = GoogleApiClient.calculate_distance(
			current_place.latitude,
			current_place.longitude,
			place.latitude,
			place.longitude
		)
		schedule_detail.update_attributes(
			distance: response['distance']['text'],
			duration: response['duration']['text']
		)
	end

	def get_attrations(schedule_id)
		@attractions = Schedule.find(schedule_id).schedule_details.preload(:place)
	end

	def calculate_distances
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

	def sort_attractions
		ScheduleDetail.transaction do
			current_attractions.each_with_index do |attraction, order|
				handle_attraction_index(attraction, order + 1)
			end
		end
	end

	def current_attractions
		@indexes.map { |index| @attractions.find_by(index: index) }
	end

	def valid_indexes?
		@indexes.sort == @attractions.pluck(:index).sort
	end

	def handle_attraction_index(attraction, new_index)
		attraction.update_attributes(index: new_index) if attraction.index != new_index
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
		@places = Place.all.preload(:region).decorate
	end
end
