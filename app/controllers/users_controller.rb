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
