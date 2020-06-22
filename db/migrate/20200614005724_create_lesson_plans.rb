class CreateLessonPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_plans do |t|
      t.string :name
      t.date :start_date
      t.integer :duration
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :subject, index: true, foreign_key: true
      t.timestamps
    end
  end
end
