class SearchsController < ApplicationController
  def index
    puts params[:departure]
    @trips = Trip.search_trips(params[:departure], params[:destination], params[:start_date])
    puts @trips
  end
end