class Book < ApplicationRecord
  belongs_to :user
  belongs_to :lesson_plan
end
