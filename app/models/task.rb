class Task < ApplicationRecord
  enum priority: { high: "high", medium: "medium", low: "low" }
  # ensures a Task record cannot be created if its missing description and priority
  validates_presence_of :description, :priority
end
