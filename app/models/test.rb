class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :users

  def self.find_by_category(category_name)
    joins(:category).where("categories.title = ?", category_name).order(title: :desc).pluck(:title)
  end
end
