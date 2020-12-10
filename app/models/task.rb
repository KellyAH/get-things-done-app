class Task < ApplicationRecord
  enum priority: { high: 1, medium: 2, low: 3 }
  # ensues a Task record cannot be created if its missing description and priority
  validates_presence_of :description, :priority
end