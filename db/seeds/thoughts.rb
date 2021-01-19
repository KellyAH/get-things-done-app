if Rails.env.development?
  Thought.create([{description: 'I want a cat'},
    {description: 'I need a new boots'},
    {description: 'I like ice cream'}])
end