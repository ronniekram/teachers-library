class LessonPlan < ApplicationRecord
  belongs_to :user
  has_many :subjects, :dependent => :destroy
  has_many :books, through: :subjects

  validates :duration, :numericality => true, :length => { :within => 1..30 }, format: { message: "Duration cannot be less than 1 day or more than 30 days."}
  validates :name, :uniqueness => true, format: { message: "A lesson plan with this name already exists."}

end
