class BudgetTripsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trip
  before_action :check_member!
  before_action :set_budget_trip, only: [:edit, :update, :destroy]

  def new
    if @trip.budget_trip.present?
      redirect_to edit_trip_budget_trip_path(@trip, @trip.budget_trip)
    else
      @budget_trip = BudgetTrip.new
      @budget_trip.budgets.build
    end
  end

  def create
    @budget_trip = @trip.build_budget_trip(budget_trip_params)

    if @budget_trip.save
      flash[:notice] = "Budget trip was created!"
      redirect_to @trip
    else
       flash[:alert] = "Errors: #{@budget_trip.errors.full_messages.to_sentence}"
       render :new
    end
  end

  def edit
  end

  def update
    if @budget_trip.update(budget_trip_params)
      flash[:notice] = "Budget trip was updated!"
      redirect_to @trip
    else
       flash[:alert] = "Errors: #{@budget_trip.errors.full_messages.to_sentence}"
       render :edit
      
    end
  end

  def destroy
    @budget_trip.destroy
    flash[:notice] = "Budget trip was deleted!"
    redirect_to @trip
  end

  private
    def set_trip
      @trip = Trip.find_by(id: params[:trip_id])
    end

    def set_budget_trip
      @budget_trip = BudgetTrip.find(params[:id])
    end

    def check_member!
      unless @trip.users.include? current_user
        flash[:alert] = "You have no permission"
        redirect_to root_path
      end
    end

    def budget_trip_params
      params.require(:budget_trip).permit(:title, budgets_attributes: [:name, :price, :_destroy])
    end
end
