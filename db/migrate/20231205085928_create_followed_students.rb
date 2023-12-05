class CreateFollowedStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :followed_students, primary_key: [:teacher_id, :student_id] do |t|
      t.references :teacher, null: false
      t.references :student, null: false

      t.timestamps
    end
  end
end
