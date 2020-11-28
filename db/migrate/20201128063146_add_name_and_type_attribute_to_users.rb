class AddNameAndTypeAttributeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
    add_index :users, :type
    change_column_null :users, :first_name, true
  end
end
