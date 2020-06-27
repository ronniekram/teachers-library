class LessonPlan < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :books
  accepts_nested_attributes_for :subject, reject_if: :all_blank

  validates :duration, presence: true, inclusion: { in: (1..30), message: "cannot be less than 1 day or more than 30 days." }
  validates :name, :start_date, presence: true, uniqueness: true
  # validates :start_date, presence: true, uniqueness: true, in_past: true
  validates :start_date,
  date: { after: Proc.new { Date.today }, message: 'must be after today' },
  on: :create
  scope :dates, -> { order(start_date: :asc) }
  
  def lesson_start
    start_date.strftime("%B %d, %Y")
  end 

  def books_attributes=(book_attributes)
    book_attributes.values.each do |book_attribute|
      if book_attribute["title"].present? && book_attribute["author"].present?
        book = Book.find_or_create_by(book_attribute)
        self.books << book
      end 
    end
  end
end