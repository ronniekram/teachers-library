class RegistrationsController < Devise::RegistrationsController

  private

  def signup_params
    params.require(:user).permit(:email, 
    :password, 
    :password_confirmation, 
    :user_name, 
    :school, 
    :grade)
  end 

  def account_update_params
    params.require(:user).permit(:email, 
    :password, 
    :password_confirmation,
    :current_password, 
    :user_name, 
    :school, 
    :grade)
  end 
end 