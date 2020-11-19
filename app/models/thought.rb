class Thought < ApplicationRecord
  belongs_to :user
  has_one :user_category

  enum priority: { 
    none:"none", 
    low: "low", 
    medium: "medium", 
    high: "high" 
  }, _prefix: true

  enum status: { 
    none: "none",
    todo: "todo",
    in_progress: "in_progress", 
    complete: "complete", 
    archived: "archived", 
    trash: "trash"
  }, _prefix: true

end
