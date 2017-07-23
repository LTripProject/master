class TripsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :confirm_invite]
  before_action :set_trip, only: [:show, :edit, :update, :destroy, :invite, :confirm_invite]
  before_action :check_permission, only: [:edit, :update, :destroy, :invite]

  def index
    @trips = Trip.all
  end


  def show
    if user_signed_in?
      @user_emails = User.where.not(id: @trip.user_ids).map(&:email)
    end
  end

  def new
    @trip = Trip.new
  end

  def edit
  end


  def create
    @trip = Trip.new(trip_params)

    @trip.departure = Region.find_by(name: params[:trip][:departure])

    if @trip.save
      @trip.users << current_user
      flash[:notice] = 'Trip was successfully created. Please set your schedule'
     redirect_to new_trip_schedule_path(@trip)
    else
      flash.now[:alert] = "Create trip errors"
      render :new
    end
  end

  def invite
    user = User.find_by_email(params[:trips][:email])

    if !@trip.users.include? user
      current_user.send_invite_mail(user, @trip)

      flash[:notice] = 'Your invite mail was sent.'
    else
      flash[:alert] = "User is in your trip group"
    end

    redirect_to @trip
  end

  def confirm_invite
    user = User.find(params[:user_id])
    invite_token = params[:invite_token]
    if @trip.users.include? user && user.check_valid_token?(@trip, invite_token)
      flash[:notice] = "Your have already in group of this trip"
    else
      @trip.users << user

      flash[:notice] = "Now, you have been member of group of this trip"
    end

    redirect_to @trip
  end

  def update
    @trip.departure = Region.find_by(name: params[:trip][:departure])

    if @trip.update(trip_params)
      flash[:notice]= 'Trip was successfully updated.'
      redirect_to @trip
    else
      flash[:alert] = "Update trip errors"
      render :edit
    end
  end

  def destroy
    @trip.destroy
    
    flash[:notice] =  "Trip was deleted"
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:start_date, :title, :description, :expected_budget)
    end

    def check_permission
      unless @trip.users.include? current_user
        redirect_to root_path, alert: "You have no permission"
      end
    end
end
