class RenameDescriptionToBodyInEvents < ActiveRecord::Migration[7.2]
  def change
    rename_column :events, :description, :body
  end
end
