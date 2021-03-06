## Personal development app based on [GTD](https://gettingthingsdone.com/what-is-gtd/) methodology
An app to manage all thoughts, ideas, todos and tasks. Collect, Refine, Remove, Reference and Schedule to free up your space in the mind.

See [planning doc](https://docs.google.com/document/d/1RIufe3PNcNIkB4iJLFXdbU5d5Q76CMfuOXUahPPNdKc/edit?ts=5f946899#)

### Architecture and models
Database diagram https://dbdiagram.io/d/5f9b12403a78976d7b79bc81

### Development

#### Setting up your local environment
1. clone repo
1. check your local machine has the correct version of ruby installed (ruby '2.6.5') : `ruby -v`
2. install dependencies: `bundle install`
2. build database and seed data: `rails db:create db:migrate db:seed`
1. start rails server: `rails s`
1. go to frontend: `http://localhost:3000/`

#### Updating your local environment with DB changes
When any database changes are made (E.g. migrations, schema.db updates etc.) local Database must be destroyed and rebuilt via: 
`rails db:reset` which is an alias for `rails db:drop db:create db:migrate`

### Tests
#### minitest model unit tests

run a test file:
```
bin/rails test test/models/thought_test.rb
bin/rails test test/models/task_test.rb
```

run all model tests
TBD

run tests in a directory
TBD

#### controller tests
`bin/rails test test/controllers/homepage_controller_test.rb`
`bin/rails test test/controllers/thoughts_controller_test.rb`
