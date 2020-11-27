class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :max_question_count, on: :create

  scope :correct_answers_scope, -> { where(correct: true) }

  def max_question_count
    errors.add(:base, 'You can`t create more that 4 answer for question') if question.answers.count >= 4
  end

end
