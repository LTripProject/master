class SearchsController < ApplicationController
  def index
    @trips = Trip.search_trips(params[:departure], params[:destination], params[:start_date])
  end
end