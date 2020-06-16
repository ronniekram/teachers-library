class CreateLessonBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :lesson_books do |t|
      t.belongs_to :lesson_plan, index: true, foreign_key: true
      t.belongs_to :book, index: true, foreign_key: true
    end
  end
end
