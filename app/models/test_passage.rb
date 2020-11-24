class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question',  optional: true
  before_validation :set_first_question, on: :create

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end
end
