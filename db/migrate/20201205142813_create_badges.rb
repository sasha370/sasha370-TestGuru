class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image_name, null: false
      t.string :rule_name, null: false
      t.string :rule_params, null: false

      t.timestamps
    end
  end
end
