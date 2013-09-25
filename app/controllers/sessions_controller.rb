class SessionsController < ApplicationController

  # GET /login
  def new

  end

  # Post / login
  def create
  # type binding pry  to have alook what to write !
  user = User.find_by(username: params[:username])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    flash[:notice] = "You've logged in! "
    redirect_to root_path
  else
    flash[:error] = 'there is something wrong with yr name or password'
    redirect_to login_path
  end

  end

  # GET /logout
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have logged out'
    redirect_to root_path
  end

end