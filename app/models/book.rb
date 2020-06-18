class Book < ApplicationRecord
  belongs_to :user
  has_many :lesson_books
  has_many :lesson_plans, through: :lesson_books
  accepts_nested_attributes_for :lesson_books
  
  validates :title, :uniqueness => true
end
