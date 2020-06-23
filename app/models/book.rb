class Book < ApplicationRecord
  has_many :lesson_plans
  has_many :subjects, through: :lesson_plans
  validates :title, :author, :presence => true

  scope :alphabet, -> { order(title: :asc) }

  def subjects_attributes=(subject_attributes_hash)
  end 

end

