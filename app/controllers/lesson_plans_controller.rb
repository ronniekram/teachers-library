class LessonPlansController < ApplicationController
  before_action :verified
  before_action :set_lesson_plan, except: [:index, :new, :create]

  def index 
    @lesson_plans = current_user.lesson_plans
  end 

  def show
  end 
  
  def new 
    @lesson_plan = LessonPlan.new
  end 

  def create 
    lesson_plan = LessonPlan.create(lesson_plan_params)
    redirect_to lesson_plan_path(lesson_plan)
  end 

  def edit 
  end 

  def update
    @lesson_plan.update(lesson_plan_params)
    @lesson_plan.save
    redirect_to lesson_plan_path(@lesson_plan)
  end 

  def destroy
    @lesson_plan.destroy unless !current_user

  end 

  private 

  def lesson_plan_params
    params.require(:lesson_plan).permit(:name, :subject, :duration)
  end 

  def set_lesson_plan
    @lesson_plan = LessonPlan.find_by(id: params[:id])
  end 

end
