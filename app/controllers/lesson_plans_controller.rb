  class LessonPlansController < ApplicationController
    before_action :set_lesson_plan, except: [:index, :new, :create]

    def index 
      @lesson_plans = current_user.lesson_plans.all
    end  
  
    def new 
      @lesson_plan = LessonPlan.new
    end 

    def create 
      @lesson_plan = current_user.lesson_plans.build(lesson_plan_params)

      if @lesson_plan.save
        redirect
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
      if @lesson_plan.save 
        redirect
      else 
        render :edit
      end 
    end 

    def destroy
      @lesson_plan.destroy
      redirect_to user_lesson_plans_path(current_user)
    end 

    private 

    def lesson_plan_params
      params.require(:lesson_plan).permit(:name, 
      :topic,
      :duration, 
      :user_id,
      :books,
      :book_ids => []
      )
    end 

    def set_lesson_plan
      @lesson_plan = LessonPlan.find_by(id: params[:id])
    end 

    def redirect 
      redirect_to user_lesson_plan_path(current_user, @lesson_plan)
    end 

  end