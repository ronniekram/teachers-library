class Subject < ApplicationRecord
  belongs_to :lesson_plan, optional: true
  belongs_to :book

  # def make_title_case 
  #   self.name = self.name.titlecase
  # end
end 