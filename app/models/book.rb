class Book < ApplicationRecord
  has_many :lesson_plans
  belongs_to :teacher
end
