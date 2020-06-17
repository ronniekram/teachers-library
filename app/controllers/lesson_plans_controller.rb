class LessonPlansController < ApplicationController
  before_action :set_lesson_plan, except: [:index, :new, :create]
  before_action :is_logged_in?

  def index 
      @lesson_plans = current_user.lesson_plans.all
  end  
  
  def new 
    @lesson_plan = LessonPlan.new
  end 

  def create 
    @lesson_plan = current_user.lesson_plans.build(lesson_plan_params)

    if @lesson_plan.save
      redirect_to lesson_plan_path(@lesson_plan)
    else 
      render :new
    end 
 
  end 

  def show
  end

  def edit 
  end 

  def update
    @lesson_plan.update(lesson_plan_params)
    redirect_to @lesson_plan
  end 

  def destroy
    @lesson_plan.destroy
  end 

  private 

  def lesson_plan_params
    params.require(:lesson_plan).permit(:name, :subject, :duration, :user_id, book_ids: [], books_attributes: [:title, :author, :subject])
  end 

  def set_lesson_plan
    @lesson_plan = LessonPlan.find_by(id: params[:id])
  end 

end
