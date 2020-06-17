class RegistrationsController < Devise::RegistrationsController

  private

  def signup_params
    params.require(:user).permit(:email, 
    :password, 
    :password_confirmation, 
    :name, 
    :school, 
    :grade)
  end 

  def account_update_params
    params.require(:user).permit(:email, 
    :password, 
    :password_confirmation,
    :current_password, 
    :name, 
    :school, 
    :grade)
  end 
end 