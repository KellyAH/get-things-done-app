class HomepageController < ApplicationController
  def index
    @new_thought = Thought.new
    @thoughts = Thought.all
    @tasks = Task.all
  end
end
