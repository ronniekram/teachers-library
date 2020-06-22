class Book < ApplicationRecord
  has_many :lesson_plans
  has_many :subjects, through: :lesson_plans
  # validates :title, :uniqueness => true
  validates :title, :author, :presence => true
  # accepts_nested_attributes_for :subjects, reject_if: proc { |attributes| attributes['name'].empty? }, allow_destroy: true
  # custom setter

  scope :alphabet, -> { order(title: :asc) }

  def subjects_attributes=(subject_attributes_hash)
  end 

end

