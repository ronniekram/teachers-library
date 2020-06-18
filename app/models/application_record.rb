class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def make_title_case
    if @book 
      self.title = self.title.titlecase
    elsif @user
      self.user_name = self.user_name.titlecase 
    elsif @subject || @lesson_plan
      self.name = self.name.titlecase 
    end 
  end 
end
