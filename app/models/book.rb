class Book < ApplicationRecord
  has_many :lesson_plans
  has_many :subjects, through: :lesson_plans
  validates :title, :author, :presence => true
  validates :title, uniqueness: true;

  scope :alphabet, -> { order(title: :asc) }
end

