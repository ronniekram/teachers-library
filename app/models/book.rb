class Book < ApplicationRecord
  has_many :lesson_plans
  has_many :subjects, through: :lesson_plans
  validates :title, :author, :publisher, presence: true
  validates :title, uniqueness: true
  validates :pages, presence: true, numericality: { greater_than_or_equal_to: 1 }

  scope :alphabet, -> { order(title: :asc) }

  def self.search(search) 
    if search
      book = Book.find_by(name: search)
      if book 
        self.where(book)
      else 
        @books = Book.all 
      end 
    else 
      @books = Book.all
    end 
  end 

end

