class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def passed_tests_by_level(level)
    tests.where(level: level)
    # Test.joins('JOIN user_tests as ut ON ut.test_id = tests.id').where('tests.level = ? AND ut.user_id = ?', level, self.id)
  end
end
