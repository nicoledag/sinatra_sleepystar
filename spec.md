# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
    used corneal gem
- [x] Use ActiveRecord for storing information in a database
    models inherit from ActiveRecord::Base.  
- [x] Include more than one model class (e.g. User, Post, Category)
    application includes model for user, baby and planner.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    user has many babies and baby has many planners.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    baby belongs to user and planner belongs to a baby.
- [x] Include user accounts with unique login attribute (username or email)
      user account includes username and password
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    baby and planner both have routes for creating, reading, updating and destroying.
- [x] Ensure that users can't modify content created by other users
    did this by checking that the baby.user is equal to the current_user
- [x] Include user input validations
    did this by checking if data is not equal to empty string.  also created html drop down list for time table to insure data is correct.
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
