class AddMissingIndexes < ActiveRecord::Migration[7.2]
  def change
    add_index :departments, :name unless index_exists?(:departments, :name)

    add_index :users, :email unless index_exists?(:users, :email)
    add_index :users, :login unless index_exists?(:users, :login)
    add_index :users, :remember_me_token_digest unless index_exists?(:users, :remember_me_token_digest)

    add_index :schedules, :start_year unless index_exists?(:schedules, :start_year)
    add_index :schedules, :end_year unless index_exists?(:schedules, :end_year)

    add_index :notifications, :published unless index_exists?(:notifications, :published)
    add_index :events, :published unless index_exists?(:events, :published)

    add_index :events, :starts_at unless index_exists?(:events, :starts_at)
  end
end
