class RelationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :get_service

  def create
    @friend_relation = @service.create
    respond_to :js
  end

  def index
      search_data = params[:search_data]
      @friends = user_signed_in? ? User.list_friend(current_user, search_data) : User.all
  end  

  def confirm
    @friend_relation = @service.confirm
    respond_to :js
  end

  def reject
    @success = @service.reject
    respond_to :js
  end

  def friends
    search_data = params[:search_data]
    @friends = User.list_friend(current_user, search_data)

    respond_to :js
  end


  private
  def get_service
    @service = FriendService.new(current_user, params[:target_id])
  end
end
