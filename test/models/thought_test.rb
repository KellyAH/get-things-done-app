require 'test_helper'
require 'minitest/autorun'

class ThoughtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

class ThoughtModelTest < Minitest::Test
  def test_thought_created_when_required_data_exists
    record_created = Thought.new(description: 'blah').save
    assert(record_created == true)
    fetch_created_record = Thought.where(description: 'blah').exists?
    assert(fetch_created_record == true)
  end

  # To simulate a breaking app change is caught by this test:
  # 1. go to app/models/thought.rb
  # 2. comment out validates_presence_of :description
  def test_thought_not_created_when_missing_required_data
    record_created = Thought.new().save
    assert(record_created == false)
  end
end