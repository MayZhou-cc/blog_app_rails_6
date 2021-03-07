class ApplicationController < ActionController::Base

  # set methods also as a helper method, then we can use it in views
  helper_method :current_user, :logged_in?

  def current_user
    # if we have done current_user find already, it will return current_user instead of searching from db again
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # return a boolean based on current_user
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be looged in to perform that action."
      redirect_to login_path
    end
  end

end
