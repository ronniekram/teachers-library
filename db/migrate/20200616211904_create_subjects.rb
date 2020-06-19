class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.belongs_to :lesson_plan, index: true, foreign_key: true
      t.belongs_to :book, index: true, foreign_key: true
      t.string :name, :default => nil
    end
  end
end
