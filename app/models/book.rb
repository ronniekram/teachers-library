class Book < ApplicationRecord
  belongs_to :user
  has_many :subjects
  has_many :lesson_plans, through: :subjects 

  validates :title, :uniqueness => true

end
