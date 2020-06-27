class Subject < ApplicationRecord
  has_many :lesson_plans
  has_many :books, through: :lesson_plans
end 