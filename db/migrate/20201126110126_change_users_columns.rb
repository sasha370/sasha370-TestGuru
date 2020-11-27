class ChangeUsersColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :password, :password_digest
    add_index :users, :email, unique: true
  end
end
