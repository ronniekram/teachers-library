class Subject < ApplicationRecord
  belongs_to :lesson_plan
  belongs_to :book
end 