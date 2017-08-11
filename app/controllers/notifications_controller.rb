class NotificationsController < ApplicationController
  def read
    respond_to :js
  end

  def delete
    respond_to :js
  end

  def destroy
    Notification.find(params[:id]).destroy
  end
end
