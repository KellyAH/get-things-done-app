class HomepageController < ApplicationController
  def greeting
    @message = "Write 3 or more things on your mind now."
  end

  def index
    @thoughts = Thought.all
  end

end
