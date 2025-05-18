class AddPositionToEmployee < ActiveRecord::Migration[7.2]
  def change
    add_column :employees, :position, :string
  end
end
