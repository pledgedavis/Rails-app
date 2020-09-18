To get started on using my app you will have to clone this repository with https 'https://github.com/pledgedavis/Rails-app.git' and run "git clone" in front of that link in your local environments terminal. Then you will also have to run "bundle update" in your terminal to download all gems and dependencies. Lastly you will then be able to run "rails s" to startup the local server that holds my project. Make sure when running rails s that the url in the browser is "http://localhost:3000/" to navigate to the welcome page and then feel free to login or sign up to an existing user.



#Rails Shoe App
  To get started on using my app you will have to clone this repository with git@https://github.com/pledgedavis/Rails-app.git and run "*git clone https://github.com/pledgedavis/Rails-app.git*" in your local environments terminal.

  Then you will run *cd Rails-app*
project.com

Install
Clone the repository
git clone git@github.com:juliendargelos/project.git
cd project
Check your Ruby version
ruby -v
The ouput should start with something like ruby 2.5.1

If not, install the right ruby version using rbenv (it could take a while):

rbenv install 2.5.1
Install dependencies
Using Bundler and Yarn:

bundle && yarn
Set environment variables
Using Figaro:

See config/application.yml.sample and contact the developer: contact@juliendargelos.com (sensitive data).

Initialize the database
rails db:create db:migrate db:seed
Add heroku remotes
Using Heroku CLI:

heroku git:remote -a project
heroku git:remote --remote heroku-staging -a project-staging
Serve
rails s
Deploy
With Heroku pipeline (recommended)
Push to Heroku staging remote:

git push heroku-staging
Go to the Heroku Dashboard and promote the app to production or use Heroku CLI:

heroku pipelines:promote -a project-staging
Directly to production (not recommended)
Push to Heroku production remote:

git push heroku