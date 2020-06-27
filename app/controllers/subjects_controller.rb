  class SubjectsController < ApplicationController  
    def subject_params
      params.require(:subject).permit(:sub_name)
    end 
  end 