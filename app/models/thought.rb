class Thought < ApplicationRecord
  belongs_to :user
  has_one :user_category
end

