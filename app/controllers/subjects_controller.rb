  class SubjectsController < ApplicationController 

    private

    def subject_params
      params.require(:subject).permit(:sub_name)
    end 
  end 