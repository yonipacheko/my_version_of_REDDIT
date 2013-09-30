class UsersController < ApplicationController
  def new
      @user = User.new
      @someting = countries
  end

  def create
    @user = User.new(user_params)
    if @user.save
    flash[:notice] = 'Now u are registered, log in pls'
    redirect_to root_path
    else
    render 'users/new'
    end


  end



  def countries
      @zone = ActiveSupport::TimeZone.new("Asia/Tokyo")
  end

  private

  def  user_params
    params.require(:user).permit(:username, :password, :time_zone)
  end
end