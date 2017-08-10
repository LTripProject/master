class RegionsController < ApplicationController
    def index
    end
    
    def all
        render json: Region.all
    end

    def get_regions
        render json: Region.all
    end

    def get_destinations
        puts params[:name]
        render json: Region.list_of_region(params[:name])
    end


end
