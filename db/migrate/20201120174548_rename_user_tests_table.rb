class RenameUserTestsTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :user_tests, :tests_users
  end
end
