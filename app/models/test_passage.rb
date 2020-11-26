class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :set_first_question, on: :create
  before_update :before_update_set_next_question

  def before_update_set_next_question
    self.current_question = next_question
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def current_question_index
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def total_questions_in_test
    test.questions.count
  end

  def test_completed_percent
    (current_question_index / total_questions_in_test.to_f * 100).to_i
  end

  def correct_answers_in_percent
    (correct_questions.to_f / total_questions_in_test.to_f * 100).to_i
  end

  def success?
    correct_answers_in_percent >= PASS_TEST_PERCENT
  end

  private

  PASS_TEST_PERCENT = 85

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answer_count = correct_answer.count
    correct_answer_count == correct_answer.where(id: answer_ids).count && correct_answer_count == answer_ids.count
  end

  def correct_answer
    current_question.answers.correct_answers
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
