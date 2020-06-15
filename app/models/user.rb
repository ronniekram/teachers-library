class User < ApplicationRecord
  has_secure_password
  has_many :lesson_plans, through: :books
  has_many :books, through: :lesson_plans
end
