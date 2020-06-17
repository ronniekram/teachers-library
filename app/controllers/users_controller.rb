class UsersController < ApplicationController
  before_action :verify, except: [:index, :new, :create]
  before_action :set_user, except: [:index, :new, :create]

  def index 
    if current_user 
      redirect_to user_path(current_user)
    end 
  end 

  def new
    @user = User.new
  end 

  def create 
    new = User.new(user_params)
    if new.password == new.password_confirmation
      user = User.create(user_params)
      session[:user_id] = user.id 
      redirect_to user_path(user)
    else  
      redirect_to '/'
    end 
  end 

  def show
    redirect_to '/' unless current_user
    if @user.nil?
      redirect_to '/'
    end 
  end

  def edit
  end 

  def update
    @user.update(user_params)
    @user.save 
    redirect_to user_path(@user)
  end 

  def destroy
    remove_user unless !current_user
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
