class HomepageController < ApplicationController

  def index
    @thoughts = Thought.all
  end

end
