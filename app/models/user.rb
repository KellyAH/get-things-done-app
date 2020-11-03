class User < ApplicationRecord
  has_many :thoughts, has_many :user_categories, :dependent => :destroy

  def full_name
    [first_name, last_name].join(' ')
  end

end
