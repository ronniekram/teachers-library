  class SubjectsController < ApplicationController 

    def index
      @subjects = Subject.all.creation
    end 

    private

    def subject_params
      params.require(:subject).permit(:sub_name)
    end 
  end 