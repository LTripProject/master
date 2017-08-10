class UsersController < ApplicationController
  before_action :set_user
  before_action :check_authorize!, except: :show

  def show
  end

  def  edit 
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your information was updated"
      redirect_to @user
    else
      flash.now[:alert] = "errors: #{@user.errors.full_messages.to_sentence}"
      render :edit
    end
  end

  def friends
    search_data = params[:search_data]
    @friends = User.list_friend(current_user, search_data)

    puts @friends
    respond_to :js
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :phone_number, :image)
    end

    def check_authorize!
      unless current_user == @user
        flash[:alert] = "You have no permission!"
        redirect_to root_path
      end
    end
end
