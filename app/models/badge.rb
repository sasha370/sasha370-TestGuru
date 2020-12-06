class Badge < ApplicationRecord
  has_and_belongs_to_many :users, depend: :destroy
  has_and_belongs_to_many :test_passages, depend: :destroy
  validates :name, :image_name, :rule_name, :rule_params, presence: true

  RULES = [
      { type: :by_category,
        description: t('.by_category'),
        scope: Category.all.pluck(:title) },
      { type: :by_level,
        description: t('.by_level'),
        scope: Test.all.distinct.pluck(:level) },
      { type: :by_attempt_number,
        description: t('.by_attempt_number'),
        scope: [1, 2, 3, 10] },
      { type: :by_passed_test_count,
        description: t('.by_passed_test_count'),
        scope: [3, 10, 50] }
  ]


end
