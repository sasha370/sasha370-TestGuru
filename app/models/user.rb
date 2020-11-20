class User < ApplicationRecord
  has_many :user_test
  has_many :tests, through: :user_test

  def passed_tests_by_level(level)
    tests.where(level: level)
  end

end
