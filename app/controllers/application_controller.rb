class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  helper_method :login_user

  def login_user(user)
    session[:id] = user.id
  end


  def authorize
    redirect_to '/login' unless current_user
  end
end


