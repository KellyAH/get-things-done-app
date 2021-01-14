class Task < ApplicationRecord
  #TODO: store priority as strings instead of integers e.g. "high" instead of 1 to avoid issues
  enum priority: { high: 1, medium: 2, low: 3 }
  # ensues a Task record cannot be created if its missing description and priority
  validates_presence_of :description, :priority
end
