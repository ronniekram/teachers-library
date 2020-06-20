  class SubjectsController < ApplicationController

    def destroy 
      @subject = current_user.subjects.find_by(id: params[:id])
      @subject.destroy 
      redirect_to user_path(current_user)
    end 

    private 

    def subject_params
      params.require(:subject).permit(:name)
    end 
  end 