class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def is_logged_in?
    current_user.present?
  end

  def fetch_login
    unless logged_in?
      redirect_to login_path, alert: "You must be logged in to access this section"
    end
  end
end
