class Book < ApplicationRecord
  belongs_to :user
  has_many :subjects, :dependent => :destroy
  has_many :lesson_plans, through: :subjects 
  validates :title, :uniqueness => true
  validates :title, :author, :presence => true
  accepts_nested_attributes_for :subjects, reject_if: proc { |attributes| attributes['name'].empty? }
  helper_method :by_subject

  def self.by_subject(subject_id) 
    where(subject: subject_id)
  end 

end
