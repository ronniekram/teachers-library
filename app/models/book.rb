class Book < ApplicationRecord
  has_many :lesson_plans
  has_many :subjects, through: :lesson_plans
  validates :title, :author, :presence => true
  validates :title, uniqueness: true;
  validates :pages, numericality: { greater_than_or_equal_to: 1 }

  scope :alphabet, -> { order(title: :asc) }
end

