class RegionsController < ApplicationController
    def index
    end
    def all
        render json: Region.all
    end
end
