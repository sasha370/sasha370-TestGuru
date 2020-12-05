class CreateBadgesUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :badges_users do |t|
      t.belongs_to :user
      t.belongs_to :badge
    end
  end
end
