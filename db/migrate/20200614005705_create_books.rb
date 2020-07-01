class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.integer :pages
      t.integer :lesson_plan_id
      t.integer :subject_ids
      t.timestamps
    end
  end
end
