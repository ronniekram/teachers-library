class Subject < ApplicationRecord
  belongs_to :lesson_plan, optional: true
  belongs_to :book
end 