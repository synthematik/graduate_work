class CreateEmployees < ActiveRecord::Migration[7.2]
  def change
    create_table :employees do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :degree
      t.string :rank
      t.string :description
      t.json :links
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
