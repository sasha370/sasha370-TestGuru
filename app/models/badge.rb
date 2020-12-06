class Badge < ApplicationRecord
  has_and_belongs_to_many :users, depend: :destroy
  has_and_belongs_to_many :test_passages, depend: :destroy

  RULES = [
      { type: :by_category,
        description: 'Все тесты одной категории',
        scope: Category.all.pluck(:title) },
      { type: :by_level,
        description: 'Все тесты одного уровня',
        scope: Test.all.distinct.pluck(:level) },
      { type: :by_attempt_number,
        description: 'Прошел тест с первой попытки',
        scope: [1, 2, 3, 10] },
      { type: :by_passed_test_count,
        description: 'Прошел n тестов',
        scope: [10, 50, 100] }
  ]
  validates :name, :image_name, :rule_name, :rule_params, presence: true


end
