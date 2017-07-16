class BudgetsController < ApplicationController
    def create
      create_budget
      create_user_budgets
      checking_data
      respond_to :js
    end

  

  def destroy
    Budget.find(params[:id]).destroy
    checking_data
    respond_to :js
  end

  def update
  end

  private


  def create_budget
    @budget_item = Budget.create(budget_item_params)
  end

  def create_user_budgets
  end

  def checking_data
    @trip = Trip.find(params[:trip_id])
  end

  def budget_item_params
    @params.require(:budget_item).permit(
        :budget_section_id, :price, :name
    )
  end

  def budget_sections
    @trip.budget_trips.includes(
        :schedule_day, :budget => {:user_budgets => :user}
    ).decorate
  end

  def people_in_trip
    @trip.users
  end

  def total_money
    @trip.total_money
  end

  def user_with_budgets
    @trip.users.includes(:user_budgets => :budget_item)
        .where(user_budgets: {id: @trip.user_budget_ids}).decorate
  end
end
