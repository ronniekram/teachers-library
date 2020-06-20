class Book < ApplicationRecord
  belongs_to :user
  has_many :subjects, :dependent => :destroy
  has_many :lesson_plans, through: :subjects 
  validates :title, :uniqueness => true
  validates :title, :author, :presence => true
  accepts_nested_attributes_for :subjects, reject_if: proc { |attributes| attributes['name'].empty? }, allow_destroy: true

  scope :alphabet, -> { order(title: :asc) }
  scope :book_plans, -> { joins()}

end

