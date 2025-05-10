class RemoveIsNotificationFromArticles < ActiveRecord::Migration[7.2]
  def change
    remove_column :articles, :is_notification, :boolean, default: false, null: false
  end
end
