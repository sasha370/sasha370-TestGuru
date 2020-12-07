class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  before_validation :set_first_question, on: :create
  before_update :before_update_set_next_question, if: :current_question
  has_and_belongs_to_many :badges, dependent: :destroy

  scope :passed, -> { where('passed = ?', true) }

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
    ((current_question_index - 1) / total_questions_in_test.to_f * 100).to_i
  end

  def correct_answers_in_percent
    (correct_questions.to_f / total_questions_in_test.to_f * 100).to_i
  end

  def success?
    correct_answers_in_percent >= PASS_TEST_PERCENT
  end

  def change_passed_status
    self.passed = true if self.success?
    save!
  end

  def time_left
    (created_at + test.timer * 60).to_i * 1000
  end

  private

  PASS_TEST_PERCENT = 85

  def set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    answer_ids && answer_ids.map(&:to_i).sort == correct_answers.ids.sort
  end

  def correct_answers
    current_question.answers.correct_answers_scope
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
