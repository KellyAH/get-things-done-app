class UserCategory < ApplicationRecord
  # belongs_to :user, :dependent => :destroy
  belongs_to :user, dependent: :destroy
end