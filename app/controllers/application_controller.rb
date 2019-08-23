 class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_admin
    render file: 'public/404', status: 404 unless current_admin?
  end

  def require_admin
    render file: 'public/404', status: 404 unless current_admin?
  end

end
