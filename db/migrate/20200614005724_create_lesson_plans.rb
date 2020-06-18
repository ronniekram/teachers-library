class CreateLessonPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_plans do |t|
      t.string :name
      t.integer :duration
      t.integer :user_id
      t.timestamps
    end
  end
end
