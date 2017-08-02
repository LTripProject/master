class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  include TripsHelper

  private
  def record_not_found
    redirect_to root_path, alert: "Record not found"
  end
end
