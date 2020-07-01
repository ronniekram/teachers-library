class LessonPlan < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :books
  validates :duration, presence: true, inclusion: { in: (1..30), message: "cannot be less than 1 day or more than 30 days." }
  validates :name, :start_date, presence: true, uniqueness: true
  validates :start_date,
  date: { after: Proc.new { Date.today }, message: 'must be after today' },
  on: :create
  accepts_nested_attributes_for :subject, reject_if: :all_blank

  scope :dates, -> { order(start_date: :asc) }
  
  def lesson_start
    start_date.strftime("%B %d, %Y")
  end 
end