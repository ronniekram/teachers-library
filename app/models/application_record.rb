class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def subjects_attributes=(subject_attributes)
    subject_attributes.values.each do |subject_attribute|
      subject = Subject.find_or_create_by(subject_attribute)
      self.subjects << subject
    end
  end
  
end
