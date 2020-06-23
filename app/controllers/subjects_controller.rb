  class SubjectsController < ApplicationController
    
    def subject_params
      params.require(:subject).permit(:name)
    end 
    
  end 