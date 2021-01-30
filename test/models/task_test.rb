require 'test_helper'
require 'minitest/autorun'

class TaskTest < ActiveSupport::TestCase
  test "test_task_created_when_required_data_exists" do
    assert Task.create(description: 'blahfoobar', priority: 'low')
  end

  test "test_tasks_not_created_when_missing_priority" do
    task = Task.new(priority: nil)
    refute task.save

    assert task.errors.include?(:priority)
    assert task.errors.details[:priority].include?(error: :blank)
  end

  test "test_tasks_not_created_when_missing_description" do
    task = Task.new(description: nil)
    refute task.save

    assert task.errors.include?(:description)
    assert task.errors.details[:description].include?(error: :blank)
  end
end