  class SubjectsController < ApplicationController

    def index
      @subjects = Subject.all
    end 

    def new
      @subject = Subject.new
    end 

    def create 
      @subject = 
    end 

    private

    def subject_params
      params.require(:subject).permit(:name)
    end 
    
  end 