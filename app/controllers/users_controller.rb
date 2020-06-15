class TeachersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]

  def index 
  end 

  def show
  end

  def new
    @user = User.new
  end 

  def create 
    user = User.create(user_params)
    if user.save && (user.password == user.password_confirmation)
      session[:user_id] = user.id 
      redirect_to user_path(user)
    else  
      render 'new'
    end 
  end 

  def edit
  end 

  def update
  end 

  def destroy
  end 

  private 

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :grade, :school)
  end 

  def set_user
    @user = User.find_by(id: params[:id])
  end 
  
end
