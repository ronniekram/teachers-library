class CreateLessonPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_plans do |t|
      t.string :name
      t.string :subject
      t.integer :duration
      t.timestamps
    end
  end
end
