# README
Iteration 0: Setup
First, we’ll need a new Rails application. Feel free to name it whatever you’d like, but be sure to create the new application with a postgres database. Create your users table and corresponding model. A User will have a name, email, and password (all strings).

# Iteration 1: Implement User Registration
The first feature that we’re going to add to our application is user registration; when users visit our site, they should be able to create accounts.

Users will need to provide us with some information. We’ll keep things simple and only require some basics:

full name
email address
password
When a user registers with our site, we’ll need to persist the information that they provide to us in our database (i.e., save the new user in the database). What data should we keep in our database? How should we store it? Remember, we’re going to store our user’s password in plaintext for now to practice the concepts before using an algorithm to hash the passwords later in the week. What constraints should we have in our database and validations in our models? What would happen if two users registered with the same e-mail address? Or, if a user did not supply an e-mail address?

Note: When users later return to our site and attempt to login, they will submit an email address and password.

# Iteration 2: Implement User Login
When users register for our site, we’ll want them to be able to later return to our site and login using the details that they provided when registering—specifically, the e-mail address and password. How will our application determine whether or not the user supplied a correct e-mail and password combination?

class User < ApplicationRecord
  e.g., User.authenticate('penelope@turing.com', 'boom')
  def self.authenticate(email, password)
     if email and password correspond to a valid user, return that user
     otherwise, return nil
  end
end
Figure 1. Shell code for an authenticate method.

We’ll add an .authenticate method to our User model to make this determination. Figure 1 provides some shell code and pseudocode for our method.

Now, let’s actually implement logging in by allowing users to submit their login credentials as a post request to a /login URL. If the user sends a valid email and password combination, we’ll log the user in. We’ll “remember” that the user is logged in by storing data in the session hash.

If the session hash and/or how to use it is unclear, revisit this reading. If it is still unclear after reading the documentation, ask for help from a cohortmate or staff member.

Note: there’s not many agreed upon RESTful routing conventions for logging in/logging out. I suggest having a UsersController that handles registering a new user (so new and create actions) and a SessionsController to handle logging in and logging out.

# Release 3: Implement Logging Out
If users can login, we’ll also want to allow them to logout. Implement a controller method that will log a user out when they visit it. This will most likely involve deleting some content from the session hash.

# Release 4: Implement Authorization
To this point, we’ve been dealing with authentication: answering the question, “Who are you?” Now we’re going to handle authorization: answering the question, “What do you have permission to do?”

In applications there are different use cases for authorization. For example, an application might have a group of administrators with special privileges. Perhaps they can edit content, delete posts, etc., while other users cannot. In our application, we’ll authorize all logged in users to view the content of our site. If users have not logged in, they will not be authorized to view the content.

What is our content? We’re practicing authorization, so let’s just create a “secret” page. Users should be authorized to see the secret page only if they’re logged in. If users try to access the secret page when they’re not logged in, they should be redirected to the login page.

One way to restrict access to authorized users is a filter. This is not the only way to accomplish this and not necessarily the best way in this case. But it’s one tool to implement this kind of pre-route logic. For an application this simple, it’s ok to put the authorization logic in the route handler itself.
