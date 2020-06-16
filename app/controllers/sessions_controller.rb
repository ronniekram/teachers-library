class SessionsController < ApplicationController

  def new
    @user = User.new
  end 

  def create 
    user = User.find_by(username: params[:username])
    user = user.try(:authenticate, params[:password])
    if user 
      session[:user_id] = user.id 
      redirect_to user_path(user)
    else 
      render :new 
    end 
  end 

  def destroy
    session.destroy unless !current_user
    redirect_to '/'
  end 

end