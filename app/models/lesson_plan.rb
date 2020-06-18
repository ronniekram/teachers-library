class LessonPlan < ApplicationRecord
  belongs_to :user
  has_many :lesson_books
  has_many :books, through: :lesson_books

  validates :duration, :numericality => true, :length => { :within => 1..30 }
  validates :name, :uniqueness => true

  accepts_nested_attributes_for :lesson_books

end
