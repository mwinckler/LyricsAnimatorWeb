class ApplicationController < ActionController::Base
  before_action :require_login

  helper_method :current_user

  private

  def current_user
    return @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to access this section"
      redirect_to log_in_path
    end
  end
end
