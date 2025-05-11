class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.string :location
      t.datetime :starts_at, null: false
      t.datetime :ends_at
      t.boolean :published, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
