class LessonPlansController < ApplicationController
  before_action :verified, except: [:index, :show]
  before_action :set_lesson_plan, except: [:index, :new, :create]

  def index 
    @lesson_plans = LessonPlan.all
  end 

  def show
  end 
  
  def new 
    @lesson_plan = LessonPlan.new
  end 

  def create 
  end 

  def edit 
  end 

  def update
  end 

  def destroy
  end 

  private 

  def lesson_plan_params
    params.require(:lesson_plan).permit(:name, :subject, :duration)
  end 

  def set_lesson_plan
    @lesson_plan = LessonPlan.find_by(id: params[:id])
  end 

end
