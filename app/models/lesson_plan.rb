class LessonPlan < ApplicationRecord
  belongs_to :user
  has_many :subjects
  has_many :books, through: :subjects

  validates :duration, :numericality => true, :length => { :within => 1..30 }
  validates :name, :uniqueness => true

  # def subjects_attributes=(subject_attributes)
  #   subject_attributes.values.each do |subject_attribute|
  #     subject = Subject.find_or_create_by(subject_attribute)
  #     self.subjects << subject
  #   end
  # end

end
