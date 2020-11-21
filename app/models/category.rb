class Category < ApplicationRecord
  has_many :tests

  validates_presence_of :title

end
