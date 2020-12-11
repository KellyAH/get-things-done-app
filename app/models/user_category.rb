class UserCategory < ApplicationRecord
  belongs_to :user, :dependent => :destroy
end


