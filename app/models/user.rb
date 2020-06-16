class User < ApplicationRecord
  has_secure_password
  has_many :books
  # has_many :lesson_plans, through: :books
  #helper_method :remove_user

  # def remove_user
  #   self.books.destroy 
  #   self.lesson_plans.destroy 
  #   self.destroy
  # end 
end
