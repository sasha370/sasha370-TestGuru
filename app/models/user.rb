class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'

  validates :email, :name, :password, presence: true

  def passed_tests_by_level(level)
    tests.where(level: level)
  end
end
