class Thought < ApplicationRecord
  # set optional: true so a thought can be created without a user
  belongs_to :user, optional: true
  has_one :user_category
  validates_presence_of :description

  enum priority: { 
    none:"none", 
    low: "low", 
    medium: "medium", 
    high: "high" 
  }, _prefix: true
# TODO: Refactor by Removing the none key value pair 
# Make sure if anyone does not choose any data from enum
# Application should Handle nil
  enum status: { 
    none: "none",
    todo: "todo",
    in_progress: "in_progress", 
    complete: "complete", 
    archived: "archived", 
    trash: "trash"
  }, _prefix: true

end

