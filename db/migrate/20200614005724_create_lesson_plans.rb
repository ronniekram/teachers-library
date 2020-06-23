class CreateLessonPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_plans do |t|
      t.string :name
      t.date :start_date
      t.integer :duration
      t.integer :user_id
      t.integer :subject_id
      t.timestamps
    end
  end
end
