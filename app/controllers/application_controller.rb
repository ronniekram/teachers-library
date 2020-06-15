class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :verified
  helper_method :current_user
  helper_method :is_logged_in?

  private

  def verified 
    redirect_to '/' unless is_logged_in?
  end 

  def current_user
    User.find_by(id: session[:user_id])
  end 

  def is_logged_in?
    !!current_user
  end 
end
