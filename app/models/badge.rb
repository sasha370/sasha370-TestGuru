class Badge < ApplicationRecord
  has_and_belongs_to_many :users, depend: :destroy
  RULES = [:by_category, :by_level, :by_attempt_number, :by_lose_category]
  validates :name, :image_url, :rule_name, :rule_params, presence: true


end
