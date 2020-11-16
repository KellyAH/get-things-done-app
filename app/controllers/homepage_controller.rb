class HomepageController < ApplicationController
  def index
    @thoughts = Thought.all
    @tasks = Task.all
  end
end
