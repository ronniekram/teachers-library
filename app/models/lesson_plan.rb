class LessonPlan < ApplicationRecord
  belongs_to :user
  has_many :books, through: :user

end
