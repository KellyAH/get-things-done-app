class User < ApplicationRecord
  has_many :thoughts, :dependent => :destroy

  def full_name
    [first_name, last_name].join(' ')
  end



end
