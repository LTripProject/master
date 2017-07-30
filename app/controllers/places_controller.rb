class PlacesController < ApplicationController
    def index
	end

	def all
        render json: Place.all
    end

end
