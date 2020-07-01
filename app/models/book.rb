class Book < ApplicationRecord
  has_many :lesson_plans
  has_many :subjects, through: :lesson_plans
  validates :title, :author, :publisher, presence: true
  validates :title, uniqueness: true
  validates :pages, presence: true, numericality: { greater_than_or_equal_to: 1 }
  accepts_nested_attributes_for :subjects

  scope :alphabet, -> { order(title: :asc) }

  def self.search(search)
    if search
      @books = Book.where('title LIKE ?', "%#{search}%")
    else 
      @books = Book.all
    end 
  end 
end

