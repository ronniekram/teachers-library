class LessonPlan < ApplicationRecord
  belongs_to :user
  has_many :lesson_books
  has_many :books, through: :lesson_books
end
