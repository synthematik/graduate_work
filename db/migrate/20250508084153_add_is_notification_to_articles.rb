class AddIsNotificationToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :is_notification, :boolean, default: false, null: false
  end
end
