class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :test
  has_many :gists, dependent: :destroy

  validates :body, presence: true

  def can_create_answer?
    self.answers.count < MAX_ANSWERS_COUNT
  end

  private

  MAX_ANSWERS_COUNT = 4
end
