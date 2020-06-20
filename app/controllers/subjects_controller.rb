  class SubjectsController < ApplicationController

    def destroy 
      Subject.find_by(id: params[:id]).destroy
    end 

    private 

    def subject_params
      params.require(:subject).permit(:name)
    end 
  end 