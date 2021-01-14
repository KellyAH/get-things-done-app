if Rails.env.development?
  Task.create([{description: 'buy cat food', priority: :high},
    {description: 'do laundry', priority: :low}])
end