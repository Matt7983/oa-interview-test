class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
