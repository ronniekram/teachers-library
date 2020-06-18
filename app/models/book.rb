class Book < ApplicationRecord
  belongs_to :user
  has_many :subjects, :dependent => :destroy
  has_many :lesson_plans, through: :subjects 
  validates :title, :uniqueness => true
  #creates setter and getter
  accepts_nested_attributes_for :subjects

end
