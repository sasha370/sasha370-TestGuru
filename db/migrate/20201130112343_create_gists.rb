class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :url, null: false
      t.string :remote_id, null: false
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :gists, [:question_id, :user_id], unique: true
  end
end
