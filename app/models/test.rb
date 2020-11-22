class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :users

  validates :title, :level, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :title, uniqueness: { scope: :level,
  #                                 message: "should have uniq name and level" }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category, -> (category_name) { joins(:category).where("categories.title = ?", category_name) }

  def self.find_by_category(category_name)
    tests_by_category(category_name).order(title: :desc).pluck(:title)
  end
end
