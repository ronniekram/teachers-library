class Book < ApplicationRecord
  belongs_to :user
  has_many :subjects, :dependent => :destroy
  has_many :lesson_plans, through: :subjects 
  validates :title, :uniqueness => true
  #creates setter and getter
  accepts_nested_attributes_for :subjects

  # def subjects_attributes=(subject_attributes)
  #   subject_attributes.values.each do |subject_attribute|
  #     subject = Subject.find_or_create_by(subject_attribute)
  #     self.subjects << subject
  #   end
  # end

end
