class AddRememberTokenDigestToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :remember_me_token_digest, :string
  end
end
