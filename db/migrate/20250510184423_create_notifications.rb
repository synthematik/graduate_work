class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :published, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
