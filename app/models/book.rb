class Book < ApplicationRecord
  belongs_to :user
  has_many :subjects, :dependent => :destroy
  has_many :lesson_plans, through: :subjects 
  validates :title, :uniqueness => true
  validates :title, :author, :presence => true
  accepts_nested_attributes_for :subjects, reject_if: proc { |attributes| attributes['name'].empty? }

  def self.by_author(author_id) 
    where(author: author_id)
  end 

end
