require 'test_helper'
require 'minitest/autorun'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

class TaskModelTest < Minitest::Test
  # Testing Task.new and not Task.create because Task.new is used the TasksController.
  def test_task_created_when_required_data_exists
    record_created = Task.new(description: 'blahfoobar', priority: 'low').save
    assert(record_created == true)
    fetch_created_record = Task.where(description: 'blahfoobar', priority: 'low').exists?
    assert(fetch_created_record == true)
  end

  def test_tasks_not_created_when_missing_priorty
    record_created = Task.new(description: 'blah').save
    assert(record_created == false)
  end

  def test_tasks_not_created_when_missing_description
    record_created = Task.new(priority: 'low').save
    assert(record_created == false)
  end

  def test_tasks_not_created_when_missing_required_data
    record_created = Task.new().save
    assert(record_created == false)
  end
end