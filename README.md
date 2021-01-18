## Personal development app based on [GTD](https://gettingthingsdone.com/what-is-gtd/) methodology
An app to manage all thoughts, ideas, todos and tasks. Collect, Refine, Remove, Reference and Schedule to free up your space in the mind.

See [planning doc](https://docs.google.com/document/d/1RIufe3PNcNIkB4iJLFXdbU5d5Q76CMfuOXUahPPNdKc/edit?ts=5f946899#)

### Architecture and models
Database diagram https://dbdiagram.io/d/5f9b12403a78976d7b79bc81

### Development
	See Gemfile 

When any database changes are made (E.g. migrations, schema.db updates etc.) local Database must be destroyed and rebuilt via: 
`rails db:reset` which is an alias for `rails db:drop db:create db:migrate`

### Tests
minitest model unit tests

run a test file:
```
bin/rails test test/models/thought_test.rb
bin/rails test test/models/task_test.rb
```

run all model tests
TBD

run tests in a directory
TBD

