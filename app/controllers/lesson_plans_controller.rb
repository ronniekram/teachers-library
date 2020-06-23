  class LessonPlansController < ApplicationController
    before_action :set_lesson_plan, except: [:index, :new, :create]

    def index 
      @lesson_plans = current_user.lesson_plans.all.dates
    end  
  
    def new 
      @lesson_plan = LessonPlan.new
      @lesson_plan.subject = Subject.find_or_create_by(name: :name)
      
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
      redirect_to lesson_plans_path
    end 

    private 

    def lesson_plan_params
      params.require(:lesson_plan).permit(:name, 
      :start_date,
      :duration, 
      :user_id,
      :book_ids => [],
      :books_attributes => [:id, :title, :author],
      :subject_id => [],
      :subject_attributes => [:id, :name]
      )
    end 

    def set_lesson_plan
      @lesson_plan = LessonPlan.find_by(id: params[:id])
    end 

    def redirect 
      redirect_to lesson_plan_path(@lesson_plan)
    end 

  end