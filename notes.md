Sinatra Project Notes: User can create, read, update, and delete a review

Interface:
User can view review form
User can submit a review form
User can edit their review
User can delete or cancel their review

User class
attributes => username, password
user signs up / logs in
user has many reviews
user has many articles

User controller and views
“/users/signup” => renders signup form
“/users/signup” => processes signup form, creates user, post
“/users/login” => renders login form
“/users/login” => processes login form, post
user can view their reviews, “/users/:id/reviews”

Reviews class
attributes => author, title, review
reviews belong to the user

Review controller and views
“/reviews/new” => renders new review form
“/reviews” => submits review
“/reviews” => renders all reviews
“/reviews/:id” => renders one review instance
“/reviews/:id/edit” => renders update form for an instance
“/reviews/:id” => updates an instance, patch
“/reviews/:id/delete” => deletes an instance

Setting up sessions
enable sessions
Use sessions hash in the methods that persist user data into the application

User authentication
use bcrypt gem
ensure user model has_secure_password
ensure users table should have password => password_digest

Logged in user
redirect to homepage
should not see signup or login if already logged in

Helper methods
the helper methods should be available to the other controllers via the application controller
Schedule
set up classes
set up database
set up controllers
set up models
set up views
