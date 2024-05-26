class AddRememberDigestToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :remember_digest, :string
    add_index :users, :remember_digest, unique: true
  end
end
