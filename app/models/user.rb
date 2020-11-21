class User < ApplicationRecord
  has_many :thoughts
  has_many :user_categories, :dependent => :destroy
end
