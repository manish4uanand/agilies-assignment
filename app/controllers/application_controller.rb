class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def current_user
    # if session[:user_id]
    #   @current_user ||= User.find(session[:user_id])
    # else
    #   @current_user = nil
    # end
    # binding.pry
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def authorize
    redirect_to '/login' unless  current_user
  end

end
