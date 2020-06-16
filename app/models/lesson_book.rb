class LessonBook < ApplicationRecord
  belongs_to :lesson_plan
  belongs_to :book
end 