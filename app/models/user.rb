class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'

  validates_presence_of :email, :name, :password

  def passed_tests_by_level(level)
    tests.where(level: level)
  end
end
