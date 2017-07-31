class RegionsController < ApplicationController
    def index
    end
    
    def all
        render json: Region.all
    end

    def get_regions
        render json: Region.get_regions
    end


end
