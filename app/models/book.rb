class Book < ApplicationRecord
  belongs_to :user
  has_many :subjects, :dependent => :destroy
  has_many :lesson_plans, through: :subjects 
  validates :title, :uniqueness => true
  validates :title, :author, :presence => true
  #creates setter and getter
  accepts_nested_attributes_for :subjects

  # def make_title_case 
  #   self.title = self.title.titlecase
  # end

end
