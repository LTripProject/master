class BudgetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trip

  def new
    @budget = Budget.new
  end

  def create
  end
  
  def update
  end

  def destroy
    Budget.find(params[:id]).destroy
    checking_data
    respond_to :js
  end


  private
    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

end
