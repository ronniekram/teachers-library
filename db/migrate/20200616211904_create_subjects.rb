class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :sub_name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
