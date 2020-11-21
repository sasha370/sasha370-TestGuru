class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :users

  validates_presence_of :title, :level, :category_id, :user_id
  validates_numericality_of :level, only_integer: true, greater_than_or_equal_to: 0
  validates :title, uniqueness: { scope: :level,
                                 message: "should have uniq name and level" }

  def self.find_by_category(category_name)
    joins(:category).where("categories.title = ?", category_name).order(title: :desc).pluck(:title)
  end
end
