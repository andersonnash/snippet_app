class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_url, alert: I18n.translate(".not_authorized") if current_user.nil?
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
