class UsersController < ApplicationController
  before_action :verified, except: [:new, :create]
  before_action :set_user, except: [:index, :new, :create]

  def index 
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

  def show
  end

  def edit
  end 

  def update
    @user.update(user_params)
    @user.save 
    redirect_to user_path(@user)
  end 

  def destroy
    @user.delete
    redirect_to '/'
  end 

  private 

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :grade, :school)
  end 

  def set_user
    @user = User.find_by(id: params[:id])
  end 
  
end
