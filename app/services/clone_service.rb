class CloneService
  def initialize(trip, current_user)
    @trip = trip
    @current_user = current_user
  end

  def execute
    ActiveRecord::Base.transaction do
      clone_trip
      clone_pre_trip
      clone_schedules
      add_current_user
      clone_budget
    end
    @new_trip
  end

  private
  def clone_trip
    @new_trip = @trip.dup
    @new_trip.visible_scope = false
    @new_trip.save
    @new_trip.schedules.destroy_all
    @new_trip.budget_trip.destroy_all
  end

  def add_current_user
    UserTrip.create(user_id: @current_user.id, trip_id: @new_trip.id)
  end

  def clone_budget
    Budget.transaction do
      @new_trip.budgets.each do |budget_item|
        
      end
    end
  end

  def clone_schedules
    @trip.schedules.each do |day|
      new_day = day.dup
      new_day.trip_id = @new_trip.id
      if new_day.save
        clone_schedule_details(day, new_day)
      end
    end
  end

  def clone_schedule_details(day, new_day)
    day.schedule_details.each do |detail|
      new_attraction = detail.dup
      new_attraction.schedule_day_id = new_day.id
      new_attraction.save
    end
  end

  def clone_pre_trip
  end
end