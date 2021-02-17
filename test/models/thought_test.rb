require 'test_helper'
require 'minitest/autorun'

class ThoughtTest < ActiveSupport::TestCase
  test "thought record is created when required data exists" do
    assert Thought.create(description: 'blahfoobar')
  end

  # To simulate a breaking app change is caught by this test:
  # 1. go to app/models/thought.rb
  # 2. comment out validates_presence_of :description
  test "thought record fails to create when missing required data" do
    thought = Thought.new(description: nil)
    refute thought.save

    assert thought.errors.include?(:description)
    assert thought.errors.details[:description].include?(error: :blank)
  end
end
