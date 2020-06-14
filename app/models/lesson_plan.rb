class LessonPlan < ApplicationRecord
  has_many :books
  belongs_to :teacher
end
