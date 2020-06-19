class Book < ApplicationRecord
  belongs_to :user
  has_many :subjects, :dependent => :destroy
  has_many :lesson_plans, through: :subjects 
  validates :title, :uniqueness => true
  validates :title, :author, :presence => true
  # accepts_nested_attributes_for :subjects, reject_if: proc { |attributes| attributes['name'].empty? }

  def subjects_attributes=(subject_attributes)
    subject_attributes.values.each do |subject_attribute|
      subject = Subject.find_or_create_by(subject_attribute)
      self.subjects << subject unless subject_attribute.empty?
    end 
  end 

end
