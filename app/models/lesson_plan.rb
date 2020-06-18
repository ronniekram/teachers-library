class LessonPlan < ApplicationRecord
  belongs_to :user
  has_many :subjects
  has_many :books, through: :subjects

  validates :duration, :numericality => true, :length => { :within => 1..30 }
  validates :name, :uniqueness => true

end
