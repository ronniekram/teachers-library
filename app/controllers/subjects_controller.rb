  class SubjectsController < ApplicationController

    def destroy 
      @subject = Subject.find_by(id: params[:id])
      @subject.destroy 
    end 

    private 

    def subject_params
      params.require(:subject).permit(:name)
    end 
  end 