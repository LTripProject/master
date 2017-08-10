class HomeController < ApplicationController
  def index
     @trips = Trip.includes(:users).all
  end

  def show
  end

  def about
  end

end