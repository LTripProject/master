class SearchsController < ApplicationController
  def index
    @trips = Trip.search_trips(params[:departure], params[:destination])
  end
end