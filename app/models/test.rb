class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy

  validates :title, :level, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level,
                                  message: I18n.t('.uniq_title_level') }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category, -> (category_name) { joins(:category).where("categories.title = ?", category_name) }
  scope :tests_by_level, -> (level) { where("level = ?", level) }
  scope :passed, ->  { joins(:test_passages).where("test_id: ?, test_passages.passed = ?", self.id, true)}

  def self.find_by_category(category_name)
    tests_by_category(category_name).order(title: :desc).pluck(:title)
  end
end
