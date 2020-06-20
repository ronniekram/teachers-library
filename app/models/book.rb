class Book < ApplicationRecord
  belongs_to :user
  has_many :subjects, :dependent => :destroy
  has_many :lesson_plans, through: :subjects 
  before_validation :find_subjects
  validates :title, :uniqueness => true
  validates :title, :author, :presence => true
  accepts_nested_attributes_for :subjects, reject_if: proc { |attributes| attributes['name'].empty? }

  scope :alphabet, -> { order(title: :asc) }

  def find_subjects
    self.subjects = self.subjects.map do |subject|
      Subject.where(value: subject.value).first_or_initialize
    end 
  end 
end

