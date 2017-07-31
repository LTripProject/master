class TripsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :confirm_invite]
  before_action :set_trip, except: [:index, :new, :create]
  before_action :check_permission, only: [:edit, :update, :destroy, :invite, :upload_gallery]

  def index
    @trips = Trip.includes(:users).all
  end


  def show
    if user_signed_in?
      @user_emails = User.where.not(id: @trip.user_ids).map(&:email)
    end
  end

  def new
    session.delete(:trip_id)
    @trip = Trip.new
  end

  def edit
    set_current_trip(@trip)
  end


  def create
    @trip = Trip.new(trip_params)
    @trip.departure = Region.find_by(name: params[:trip][:departure])

    if @trip.save
      set_current_trip(@trip)
      @trip.users << current_user
      flash[:notice] = 'Trip was successfully created. Please set your schedule'
      redirect_to trip_schedules_path(@trip)
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

  def add_photos
    @trip.photos += trip_params[:new_photos]
    @trip.update_attributes(:photos => @trip.photos)
    redirect_to :upload_gallery
  end

  def upload_gallery
    # @trip.photos.build
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

  def join
    if @trip.users.include?(current_user)
      flash[:alert] = "You have already in trip group"
    else
      @trip.users << current_user
      flash[:notice] = "You are in trip group now"
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
      @trip = Trip.includes(:users).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:start_date, :title, :description, :expected_budget, {new_photos: []})
    end

    def check_permission
      unless @trip.users.include? current_user
        redirect_to root_path, alert: "You have no permission"
      end
    end
end
