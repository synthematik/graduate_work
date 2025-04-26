class CreateSchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :schedules do |t|
      t.string :title
      t.integer :course_number
      t.string :education_form
      t.string :semester_type
      t.string :schedule_type
      t.integer :start_year
      t.integer :end_year
      t.text :file_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
