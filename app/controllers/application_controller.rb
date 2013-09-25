class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  before_action :settingAccessToCategories


  helper_method :current_user, :logged_in?

  def current_user

    #this is memoization??
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user   #bang bang turns anything into true or false
  end

  def require_user
    if !logged_in?
      flash[:error] = 'Must be logged in to do that'
      redirect_to root_path
    end
  end

  private
  def settingAccessToCategories
    @categories = Category.all
  end

end
