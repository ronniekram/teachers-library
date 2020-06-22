class LessonPlan < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :books
  validates :duration, presence: true, inclusion: { in: (1..30), message: "cannot be less than 1 day or more than 30 days." }
  validates :name, presence: true, uniqueness: true
  validates :start_date, presence: true, uniqueness: true

  scope :dates, -> { order(start_date: :asc) }

  def lesson_start
    start_date.strftime("%B %d, %Y")
  end 

  def subject_attributes=(subject_attributes)
    subject_attributes.values.each do |subject_attribute|
      if subject_attribute.present?
        subject = Subject.find_or_create_by(subject_attribute)
        self.subjects << subject
      end 
    end
  end

  def books_attributes=(books_attributes)
    books_attributes.values.each do |book_attributes|
      if book_attributes.present?
        book = Book.find_or_create_by(book_attributes)
        self.books << book
      end 
    end
  end

end