class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates_presence_of :body, :test_id


end
