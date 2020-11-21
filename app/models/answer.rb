class Answer < ApplicationRecord
  belongs_to :question

  validates_presence_of :body, :correct, :question_id
  validate :max_question_count, on: :create

  scope :correct_answer, -> {where(correct: true)}

  def max_question_count
    errors.add(:base, 'You can`t create more that 4 answer for question') if question.answers.count >= 4
  end

end
