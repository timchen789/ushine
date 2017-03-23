Rails-Angular-Postgres-and-Bootstrap eBook
https://s3-ap-southeast-1.amazonaws.com/mylekha-ebook/IT+%26+Programming/html_css_javascript/Rails-Angular-Postgres-and-Bootstrap.pdf
Source Code for "Rails, Angular, Postgres, and Bootstrap" 
https://pragprog.com/titles/dcbang/source_code
Copyrights apply to this source code. 
You may use the source code in your own projects, 
however the source code may not be used to create training material, 
courses, books, articles, and the like. 
We make no guarantees that this source code is fit for any purpose. 
Download dcbang-code.tgz 
Download dcbang-code.zip 
-------------- Let's get started --------------
$ rails new --skip-turbolinks  --skip-spring  --skip-test-unit -d postgresql  shine
vvvvv Set up prostres for my rails app "shine" on c9 as follows:vvvvvvvvvvvvvv 
(following http://stackoverflow.com/a/29379969/5521564219)
How to setup PostgreSQL & Rails on Cloud9
At time of writing, Cloud9 has PostgreSQL pre-installed, so you won't need to install it yourself. However, its not running by default, so you will need to start it with this command in the terminal:
$ sudo service postgresql start
Change the PostgreSQL password to 'password' (or choose a different password):
$ sudo sudo -u postgres psql
# This will open the psql client.
# Type \password and press enter to begin process
# of changing the password:
postgres=# \password
# Type your new password (e.g. "password") and press enter twice:
Enter new password: 
Enter it again: 
# Password changed, quit psql with \q
postgres=# \q 
Edit your config/database.yml to be:
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  # Important configs for cloud9, change password value
  # to what you entered in the previous psql step.
  template: template0
  username: ubuntu
  password: password
development:
  <<: *default
  database: your_app_name_development
test:
  <<: *default
  database: your_app_name_test
production:
  <<: *default
  database: your_app_name_production
  username: your_app_name
  password: <%= ENV['YOUR_APP_NAME_DATABASE_PASSWORD'] %>
(Note the template, username, and password configs in the default section above are essential).
Add the pg gem to your Gemfile:
gem 'pg'
Run bundle install.
Remove the sqlite gem from your Gemfile (and optionally delete the db/*.sqlite3 files)
Create the database, load schema.rb, and seed the database using the db:setup task:
bundle exec rake db:setup
# Run bin/rake -AD db to see all db-related tasks
Start or restart your rails app and check it is working.
Note, the non-seed data from your old sqlite database will not be present in the new database.
If you ever want to use the psql client to interact with PostgreSQL directly, in the terminal run psql or run bin/rails db.
sudo service postgresql start
----------------------------------------------------------------------------

 you’ll need to create a user 
 Our user will be named shine and have the password shine. 
 We can create it using the command-line app installed with Postgres called createuser. 
 $ createuser --createdb --login -P shine 
 You’ll be prompted for a password, so enter shine twice.
 ( you can also create a user inside Postgres directly. 
 You’ll need to access the postgres schema, 
 which you can usually do with psql like so: 
 $ psql postgres
 postgres> CREATE USER shine PASSWORD 'shine')
)
Next, modify config/database.yml so the app can connect to the database. 
default: &default 
adapter: postgresql 
encoding: unicode 
host: https://ucast-timchen7.c9users.io/
username: shine➤ p
password: shine➤ p
pool: 5

Next, we’ll set up our database. 
$ bundle exec rake db:create 
$ bundle exec rake db:migrate 
$ rails s -b $IP -p $PORT
---> see "rails welcome page" on https://ucast-timchen7.c9users.io/ OK!!!
===================== above: 1st commit ===============================
edit login/create-dashboard/shine/config/routes.rb 
  root 'dashboard#index'
create app/controllers/dashboard_controller.rb.
create app/views/dashboard/index.html.erb
install Devise gem :
  gem 'devise'
$ bundle exec rails generate devise:install 
  create config/initializers/devise.rb 
  create config/locales/devise.en.yml
$ bundle exec rails generate devise user 
  invoke active_record 
  create db/migrate/20150228234349_devise_create_users.rb 
  create app/models/user.rb 
  insert app/models/user.rb 
  route devise_for :users
 See GIGN UP & LOG IN pages
=================== above: 2nd commit  ===================================================== 
We can also see that Devise has created an entry in the USERS table by going into the database directly. 
Use the Rails dbconsole command:
$ bundle exec rails dbconsole 
shine_development=>  \x on 
Expanded display is on. 
shine_development=>  select * from users; 
-[ RECORD 1 ]----------+-------------------------------------------------------------
id                     | 1
email                  | t1@gmail.com
encrypted_password     | $2a$11$5UCrTn6pY3Ni1I.9ftCjB.tS/1B34WC6gTin10SWiJHnV6VCZw66q
reset_password_token   | 
reset_password_sent_at | 
remember_created_at    | 
sign_in_count          | 1
current_sign_in_at     | 2017-03-19 04:06:00.079409
last_sign_in_at        | 2017-03-19 04:06:00.079409
current_sign_in_ip     | 118.233.72.58
last_sign_in_ip        | 118.233.72.58
created_at             | 2017-03-19 04:06:00.073404
updated_at             | 2017-03-19 04:06:00.080374
shine_development=> \q
------------- Installing Bootstrap with Bower --
# Bower is going to make our lives easier by giving us clear 
# and complete control over our front-end assets. 
$ sudo apt-get update
$ sudo apt-get install nodejs
$ sudo apt-get install npm
$ npm install -g bower
Edit login/install-bootstrap/shine/Gemfile 
gem 'bower-rails
$ bundle install 
# it allows us to specify dependencies in a simple file called Bowerfile, 
# which will be easier to work with than the JSON format15 required by the bower 
# command-line app. Bower-rails also provides rake tasks to run Bower for us. 
$bundle exec rake -T bower
rake bower:cache:clean                   # Clear the bower cache ('bower cache clean')
rake bower:clean                         # Attempt to keep only files listed in 'main' of each component's bower.json
rake bower:install[options]              # Install components from bower
rake bower:install:deployment[options]   # Install components from bower using previously generated bower.json
rake bower:install:development[options]  # Install both dependencies and devDependencies from bower
rake bower:install:production[options]   # Install only dependencies, excluding devDependencies from bower
rake bower:list                          # List bower components
rake bower:resolve[relative_directory]   # Resolve assets paths in bower components
rake bower:update[options]               # Update bower components
rake bower:update:prune[options]         # Update existing components and uninstalls extraneous components
timchen7:~/shine (master) $ 

===================== Download Bootstrap ==========================
Bower packages are hosted in public git repositories (usually hosted on GitHub) 
and registered at http://bower.io/search, which is analogous to http://rubygems.org.
timchen7:~/shine (master) $ bower search bootstrap | head 
Search results:
    bootstrap https://github.com/twbs/bootstrap.git
    bootstrap-bo https://github.com/brentoneill/bootstrap.git
    x-bootstrap https://github.com/x-element/x-bootstrap.git
    bootstrap-2 https://github.com/twbs/bootstrap.git
    bootstrap.ui https://github.com/visionappscz/bootstrap-ui.git
    bootstrap-dv https://github.com/JKAussieSkater/Bootstrap-DV.git
    bootstrap-gap https://github.com/evangraaff/bootstrap-gap.git
    mk-bootstrap https://github.com/geometrybase/mk-bootstrap.git
the very first result shows a URL to the official Bootstrap source code
on GitHub. The string preceding that URL is the name you need to use in 
your Bowerfile to bring down that asset.    

Create login/install-bootstrap/shine/Bowerfile
  asset 'bootstrap-sass-official'
$ bundle exec rake bower:install
bower.js files generated
/home/ubuntu/.nvm/versions/node/v4.7.3/bin/bower install -p 
bower bootstrap-sass-official#*       not-cached https://github.com/twbs/bootstrap-sass.git#*
bower bootstrap-sass-official#*          resolve https://github.com/twbs/bootstrap-sass.git#*
bower bootstrap-sass-official#*         download https://github.com/twbs/bootstrap-sass/archive/v3.3.7.tar.gz
bower bootstrap-sass-official#*          extract archive.tar.gz
bower bootstrap-sass-official#*         resolved https://github.com/twbs/bootstrap-sass.git#3.3.7
bower jquery#1.9.1 - 3                not-cached https://github.com/jquery/jquery-dist.git#1.9.1 - 3
bower jquery#1.9.1 - 3                   resolve https://github.com/jquery/jquery-dist.git#1.9.1 - 3
bower jquery#1.9.1 - 3                  download https://github.com/jquery/jquery-dist/archive/3.2.0.tar.gz
bower jquery#1.9.1 - 3                   extract archive.tar.gz
bower jquery#1.9.1 - 3                  resolved https://github.com/jquery/jquery-dist.git#3.2.0
bower bootstrap-sass-official#*          install bootstrap-sass-official#3.3.7
bower jquery#1.9.1 - 3                   install jquery#3.2.0
bootstrap-sass-official#3.3.7 bower_components/bootstrap-sass-official
└── jquery#3.2.0
jquery#3.2.0 bower_components/jquery  
--------------- Add Bootstrap to Our Asset Pipeline ---------------
The Rails asset pipeline manages the deployment of front-end assets to a user’s browser.
The Rails asset pipeline packages the files in app/assets/stylesheets and app/assets/javascripts 
as application.css and application.js, respectively. 
The Railsasset pipeline (which is powered by sprockets17) configured with asset paths that 
contain directives, Much like how we piece together a Ruby application by setting paths and using require
login/install-bootstrap/shine/app/assets/stylesheets/application.css 
/* *= require_tree . 
*= require_self 
*= require 'bootstrap-sass-official'➤ *
/
$ rails s -b $IP -p $PORT
you’ll see that the font has changed from your browser’s default (likely Times New Roman)
to Helvetica, which is what Bootstrap uses by default.
If you view the source being served, you’ll see that our application has picked up the assets 
in vendor/assets/bower_components/bootstrap-sass-official. 
<html>
<head>
  <title>Shine</title>
  <link rel="stylesheet" media="all" href="/assets/application.self-d885a0a66bd595c10edb24f8879f94e334d88be0730c4d7c7a7b57c731c09037.css?body=1" />
<link rel="stylesheet" media="all" href="/assets/bootstrap-sass-official/assets/stylesheets/_bootstrap.self-
----------------------------Above: 3rd commit ---------------------------------
==== Styling the Login and Registration Forms  =====
what Bootstrap does requires us to add classes to certain elements in a particular way. 
This means we’ll need access to the markup before we get started. 
and, markup for our login screens—they were all provided by Devise, so let's extract those views 
into our application,allowing us to modify them
$ bundle exec rails generate devise:views
Expected string default value for '--test-framework'; got false (boolean)
Expected boolean default value for '--markerb'; got :erb (string)
      invoke  Devise::Generators::SharedViewsGenerator
      create    app/views/devise/shared
      create    app/views/devise/shared/_links.html.erb
      invoke  form_for
      create    app/views/devise/confirmations
      create    app/views/devise/confirmations/new.html.erb
      create    app/views/devise/passwords
      create    app/views/devise/passwords/edit.html.erb
      create    app/views/devise/passwords/new.html.erb
      create    app/views/devise/registrations
      create    app/views/devise/registrations/edit.html.erb
      create    app/views/devise/registrations/new.html.erb
      create    app/views/devise/sessions
      create    app/views/devise/sessions/new.html.erb
      create    app/views/devise/unlocks
      create    app/views/devise/unlocks/new.html.erb
      invoke  erb
      create    app/views/devise/mailer
      create    app/views/devise/mailer/confirmation_instructions.html.erb
      create    app/views/devise/mailer/password_change.html.erb
      create    app/views/devise/mailer/reset_password_instructions.html.erb
      create    app/views/devise/mailer/unlock_instructions.html.erb
Now that we can edit these files, we can use Bootstrap’s CSS classes to make them 
look how we’d like.       
1st, add "<%= link_to "Log Out", destroy_user_session_path, method: :delete %> "
into shine/app/views/dashboard/index.html.erb
to log ourselves out so we can see & style both the login screen and the registration screen
ebook page 17...23
================= Next: Using Postgres to Make Our Login More Secure =====================
-------------- Chapter2:Secure the Login Database with Postgres Constraints---------------
$ bundle exec rails g migration add-email-constraint-to-users 
------------ Next: Using Postgres Indexes to Speed Up a Fuzzy Search ------------------
--------- CHAPTER 3 Use Fast Queries with Advanced Postgres Indexes ----------------
$ bundle exec rails g model customer first_name:string last_name:string email:string username:string

!!!!!!! ERROR !!!!!!!!!!!!!
http://stackoverflow.com/questions/28925848/error-with-postgresql-datababse-is-the-server-running-locally-and-accepting-co
Q: psql: could not connect to server: 
   No such file or directory Is the server running locally and accepting connections 
   on Unix domain socket "/var/run/postgresql/.s.PGSQL.5432"?
A: even though there is clearly a socket with this path available as reported by 
   netstat -lp --protocol=unix | grep postgres
   The problem can be solved by removing the lock file and restarting postgresql. 
   This is definitely less invasive than a purge and re-install.
   $ sudo rm /var/run/postgresql/.s.PGSQL.5432.lock 
   $ sudo service postgresql restart
=============== !! ERROR!!!! ==============
Question:
timchen7:~/shine (master) $ bundle exec rake db:drop
PG::InsufficientPrivilege: ERROR:  must be owner of database shine_development
: DROP DATABASE IF EXISTS "shine_development"
Answer:
http://stackoverflow.com/questions/7210563/rake-aborted-error-must-be-owner-of-database
Did you ensure the ownership of the test DB? try running the \l command on Postgres console client and check the ownerships.
timchen7:~/shine (master) $ rails db
Password: 
psql (9.3.15)
SSL connection (cipher: DHE-RSA-AES256-GCM-SHA384, bits: 256)
Type "help" for help.

shine_development=> \l
                                 List of databases
       Name        |  Owner   | Encoding  | Collate | Ctype |   Access privileges   
-------------------+----------+-----------+---------+-------+-----------------------
 postgres          | postgres | SQL_ASCII | C       | C     | 
 shine_development | ubuntu   | UTF8      | C       | C     | 
 shine_test        | ubuntu   | UTF8      | C       | C     | 
 template0         | postgres | SQL_ASCII | C       | C     | =c/postgres          +
                   |          |           |         |       | postgres=CTc/postgres
 template1         | postgres | SQL_ASCII | C       | C     | =c/postgres          +
                   |          |           |         |       | postgres=CTc/postgres
 ubuntu            | ubuntu   | SQL_ASCII | C       | C     | 
(6 rows)
shine_development=> \q
$ rake db:rollback
$ rake db:migrate
============p.32 Next: Using Postgres Indexes to Speed Up a Fuzzy Search ========
CHAPTER 3 Use Fast Queries with Advanced Postgres Indexes
use a gem called faker,1 which is typically used to create test data. 
gem 'faker'
$ bundle install
We’ll create this data by writing a small script in db/seeds.rb. 
Rails’s seed data2 feature is intended to prepopulate a fresh database 
with reference data
$ bundle exec rake db:seed 
============ p.39: Implementing the Search Logic =================
$ bundle exec rails g migration add-lower-indexes-to-customers 
timchen7:~/shine (master) $ bundle exec rails g migration add-lower-indexes-to-customers 
Expected string default value for '--test-framework'; got false (boolean)
      invoke  active_record
      create    db/migrate/20170320035754_add_lower_indexes_to_customers.rb
timchen7:~/shine (master) $ bundle exec rake db:migrate                                                                                 
== 20170320035754 AddLowerIndexesToCustomers: migrating =======================
-- execute(" \n      CREATE INDEX \n        customers_lower_last_name \n      ON \n        customers (lower(last_name) varchar_pattern_ops) \n    ")
   -> 0.0067s
-- execute(" \n      CREATE INDEX \n        customers_lower_first_name \n      ON \n        customers (lower(first_name) varchar_pattern_ops) \n    ")
   -> 0.0039s
-- execute(" \n      CREATE INDEX \n        customers_lower_email \n      ON \n        customers (lower(email)) \n    ")
   -> 0.0042s
== 20170320035754 AddLowerIndexesToCustomers: migrated (0.0151s) =============
Now  we can see that the results are about 50 times faster
Postgres has many advanced features. Fortunately, Rails makes it easy for us to use these 
features via execute, even if they aren’t baked directly into the Active Record API.
============= p.50 : Next: Better-Looking Results with Bootstrap’s List Group ====
CHAPTER 4 Create Clean Search Results with Bootstrap Components
--using Bootstrap’s list group, its typographic styles, and CSS floats
-----p.57 Paginating the Results Using Bootstrap’s Components -----
Adding Pagination Controls to the View 
To style the previous/next links, Bootstrap provides a component called a pager. 
Next: Angular!
================= Deploy to Heroku =====================
$git add .
$git commit -m "Paginating the Search Results Using Bootstrap"
$ heroku create ushine
$ git push heroku master
$ heroku run rake db:migrate
$ heroku run rake db:seed
$ heroku open
======================!!! ANGULAR.JS!!! ========================
p.61 CHAPTER 5 Build a Dynamic UI with AngularJS
set up Angular and learn how it works by implementing a “typeahead” 
search. Instead of requiring our users to type a search term and 
click a search button, we’ll fetch results in real time, as they type.
(perform an asynchronous search as the user types, by listening for 
the right DOM events and using Angular’s Ajax features. )
Let's install Angular using Bower, and arrange for Angular’s code to be 
served up by the Rails' asset pipeline
(1) edit .../shine/Bowerfile :
asset 'bootstrap-sass-official' 
# START_HIGHLIGHT 
# END_HIGHLIGHT 
asset 'angular', '~> 1.5' 
resolution 'angular', '1.5'
(2) Next, we’ll install it using the rake task provided by bower-rails.
$ bundle exec rake bower:install
timchen7:~/shine (master) $ bundle exec rake bower:install
bower.js files generated
/home/ubuntu/.nvm/versions/node/v4.7.3/bin/bower install -p 
bower angular#~> 1.5        not-cached https://github.com/angular/bower-angular.git#~> 1.5
bower angular#~> 1.5           resolve https://github.com/angular/bower-angular.git#~> 1.5
bower angular#~> 1.5          download https://github.com/angular/bower-angular/archive/v1.5.11.tar.gz
bower angular#~> 1.5           extract archive.tar.gz
bower angular#~> 1.5          resolved https://github.com/angular/bower-angular.git#1.5.11
bower angular         extra-resolution Unnecessary resolution: angular#1.5
bower angular#~> 1.5           install angular#1.5.11

angular#1.5.11 bower_components/angular 
(3)With Angular installed, we need to bring it into the asset pipeline by adding it to 
app/assets/javascripts/application.js.
//= require jquery 
//= require jquery_ujs 
//= require angular
//= require_tree
(4)
typeahead/install-angular/shine/config/routes.rb 
get "angular_test", to: "angular_test#index" 
Then we create AngularTestController to serve up the index action.
typeahead/install-angular/shine/app/controllers/angular_test_controller.rb 
class AngularTestController < ApplicationController 
  def index 
  end 
end
edit index.html.rb..
typeahead/install-angular/shine/app/assets/javascripts/angular_test_app.js 
angular.module('angular_test',[ ])
$rails s -b $IP-p $PORT
Hello, chen
Name  
chen
================= p.65 Porting Our Search to Angular ==========================
We’ll
(A)write JavaScript code that grabs the search term the user entered, 
(B)submits an Ajax request to the server, 
(C)receives a JSON response, and 
(D)updates the DOM with the results of the search, 
all without the page reloading. 
i.e.
(a) Angularize our view by removing all the Rails helpers and 
adding some Angular-specific attributes 
(b) write some JavaScript that shows us how to respond to a click event. 
(c)update that JavaScript to put canned data into the view when the user 
does a search -- this will demonstrate how we can manipulate the DOM. 
(e)change our code to get real results from the server by making an Ajax call.
-------Angularizing Our View --------
We’ll use an article element to wrap the markup in app/views/customers/index.html.erb 
and to hold the ng-app and ng-controller directives. 
<article ng-app="customers" ng-controller="CustomerSearchController"> 
<!-- rest of the existing markup --> 
</article>
-------Creating Our First Angular Controller ----
Now we can use Angular directives to access data from form elements, 
Next, we need to render a list of results in our view. 
use Ajax requests and JSON responses from the server
==========================================================================
==================== new Clone to new clouse9 Workspace ==================
======================= do following step first ==========================
==========================================================================
(1)vvvvv Set up prostres for my rails app "shine" on c9 as follows:vvvvvvv 
(following http://stackoverflow.com/a/29379969/5521564219)
How to setup PostgreSQL & Rails on Cloud9
At time of writing, Cloud9 has PostgreSQL pre-installed, so you won't need to install it yourself. However, its not running by default, so you will need to start it with this command in the terminal:
$ sudo service postgresql start
Change the PostgreSQL password to 'password' (or choose a different password):
$ sudo sudo -u postgres psql
# This will open the psql client.
# Type \password and press enter to begin process
# of changing the password:
postgres=# \password
# Type your new password (e.g. "password") and press enter twice:
Enter new password: 
Enter it again: 
# Password changed, quit psql with \q
postgres=# \q 
(2)you’ll need to create a user 
Our user will be named shine and have the password shine. 
We can create it using the command-line app installed with Postgres called createuser. 
$ createuser --createdb --login -P shine 
You’ll be prompted for a password, so enter shine twice.
(3) 
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
$ rails s -b $IP -p $PORT
==================== p.72 Rendering Canned Search Results ===============
How to render collections with Angular ?
p.74: Now when we click Find search results render on the page.
============= p.74 Making an Ajax Request to Complete the Circle =======
use Rails’s respond_to method to indicate that we handle JSON and 
then use the json method to specify the JSON we want to return.
p.76: If we start our server and navigate to http://localhost:3000/customers,
we can now perform a search powered by Angular! 
===== p.76 In Angular there are filters that work more like Unix pipes 
than method calls. In this case, Angular provides a filter named 
date that can be used inside the curly brackets in our templates
====== p.77 Reimplementing the Pagination ======================
Need to keep track of what page we are on, and use it in $http.get. 
=======p.79 Changing Our Search to Use Typeahead ===============
We need to arrange for search to be invoked when the user is typing 
and not when the user clicks the Find Customers button. 
Just as we used ng-click to bind the click event on the button 
to our search function, we can use the ngchange on the input field 
to invoke search when the text field contents change. 
======================= p.81 Next: Testing ====================
1. Ruby RSpec testing using gem "rspec-rails"
$ bundel install
$ bundle exec rails g rspec:install 
timchen7:~/ushine (master) $ bundle exec rails g rspec:install 
      create  .rspec
      create  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb
2. Executing our client-side code the same way a user’s browser would, 
using Capybara, PhantomJS, Jasmine, and Poltergeist
======== p.85 add nondefault configuration options to spec_helper.rb =====
create a dummy spec file to verify everything’s working in spec/dummy_spec.rb.
$ rake db:migrate RAILS_ENV=test
$ rake
-->see --------------------------------------------------------
timchen7:~/ushine (master) $ rake
/usr/local/rvm/rubies/ruby-2.3.0/bin/ruby -I/usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.4/lib:/usr/local/rvm/gems/ruby-2.3.0/gems/rspec-support-3.5.0/lib /usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.4/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb
Run options: include {:focus=>true}
All examples were filtered out; ignoring {:focus=>true}
Randomized with seed 13816
testing that rspec is configured
  can fail (FAILED - 1)
  should pass
Failures:
  1) testing that rspec is configured can fail
     Failure/Error: expect(false).to eq(true)
       expected: true
            got: false
       (compared using ==)
     # ./spec/dummy_spec.rb:7:in `block (2 levels) in <top (required)>'
Top 2 slowest examples (0.09872 seconds, 97.8% of total time):
  testing that rspec is configured can fail
    0.097 seconds ./spec/dummy_spec.rb:6
  testing that rspec is configured should pass
    0.00172 seconds ./spec/dummy_spec.rb:3
Finished in 0.10092 seconds (files took 9.92 seconds to load)
2 examples, 1 failure
Failed examples:
rspec ./spec/dummy_spec.rb:6 # testing that rspec is configured can fail
Randomized with seed 13816
/usr/local/rvm/rubies/ruby-2.3.0/bin/ruby -I/usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.4/lib:/usr/local/rvm/gems/ruby-2.3.0/gems/rspec-support-3.5.0/lib /usr/local/rvm/gems/ruby-2.3.0/gems/rspec-core-3.5.4/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb failed
timchen7:~/ushine (master) $ 
--------------------------skip testing ~page 116 ------------------------------
======= p.117 Next: Level Up on Everything : build a complex customer detail view =====
first, we need to turn our simple search screen into a single-page app (SPA) by 
learning about Angular’s router and navigation services.
---p. 119 CHAPTER 7 Create a Single-Page App Using Angular’s Router ---
learn how to manage your Angular views in different templates—just like we do in Rails
and have them play well with the asset pipeline.
========= p.121 Using Angular’s Router for User Navigation =============
Currently, our Angular app hard-codes both the view and the controller. 
The view is hard-coded by virtue of having all the HTML inside 
<articleng-app='customers'>. 
The controller is hard-coded by the use of the ng-controller directive. 
We’ll break that hard-coding with the router. 
To accomplish this, we’ll do three things. 
(A)First, we install the angular-route module, which provides the router itself. 
(B)Next, we’ll configure it with a single route to match what we have now—
a single slash (/) should render the customer search view. 
(C)Finally, we’ll extract our existing view code into a standalone template, 
which will require using a Rails plugin called angular-railstemplates to 
help with asset pipeline integration.
(1)
$ sudo apt-get update
$ sudo apt-get install nodejs
$ sudo apt-get install npm
$ npm install -g bower
Edit login/install-bootstrap/shine/Gemfile 
gem 'bower-rails
$ bundle install   
../shine/Bowerfile 
  asset 'angular-route
$ bundle exec rake bower:install  
timchen7:~/ushine (master) $ bundle exec rake bower:install
bower.js files generated
/home/ubuntu/.nvm/versions/node/v4.7.3/bin/bower install -p 
bower angular-route#*       not-cached https://github.com/angular/bower-angular-route.git#*
bower angular-route#*          resolve https://github.com/angular/bower-angular-route.git#*
bower angular-route#*         download https://github.com/angular/bower-angular-route/archive/v1.6.3.tar.gz
bower angular-route#*          extract archive.tar.gz
bower angular-route#*         resolved https://github.com/angular/bower-angular-route.git#1.6.3
bower angular#1.6.3         not-cached https://github.com/angular/bower-angular.git#1.6.3
bower angular#1.6.3            resolve https://github.com/angular/bower-angular.git#1.6.3
bower angular#1.6.3           download https://github.com/angular/bower-angular/archive/v1.6.3.tar.gz
bower angular#1.6.3            extract archive.tar.gz
bower angular#1.6.3           resolved https://github.com/angular/bower-angular.git#1.6.3
Please note that,
    dsl-generated-dependencies depends on angular#~> 1.5 which resolved to angular#1.5.11
    angular-route#1.6.3 depends on angular#1.6.3 which resolved to angular#1.6.3
Resort to using angular#1.5 which resolved to angular#1.5.11
Code incompatibilities may occur.
bower angular-route#*          install angular-route#1.6.3
angular-route#1.6.3 bower_components/angular-route
└── angular#1.5.11
(2)bring it into the asset pipeline by adding it to app/assets/javascripts/application.js.
//= require angular-route
(3)Angular app needs to explicitly bring the module in as a dependency
Each Angular app, when declared, has a list of dependent modules. 
If you recall, when we declared our app using angular.module, 
the second argument was an empty array: var app = angular.module('customers',[]); 
That argument is our app’s list of dependent modules
Now, we’ll need to add angular-route to this array.
var app = angular.module( 'customers', [ 'ngRoute'] ); 
(4)Because the Rails route /customers caused the CustomersController to render 
the index action, which, in turn, rendered app/views/customers/index.html.erb, 
which contains the ng-app directive, all routes visible to the Angular app are 
relative to /customers and thus our app’s route is /.
====== p.123 Converting Our Existing View to an Angular Template ====
(5)To configure routes using angular-route, we need access to the object 
$routeProvider which configure the controller and template to use for 
a given URL.We can register this route using the when function.
shine/app/assets/javascripts/customers_app.js 
app.config([ "$routeProvider", function($routeProvider) {$routeProvider.when()...}
(6) The last step is to move our view template code out of app/views/customers/index.html.erb 
and into the file specified in our routing config customer_search.html. 
To do that, we need to know where that file goes, and how Angular will access it at runtime.
This requires configuring the asset pipeline to serve Angular templates. 
------- Serving Angular Templates from the Asset Pipeline --------
most browsers won’t allow Angular to fetch the HTML file without configuring 
the CDN server for cross-origin resource sharing (CORS). That can be complicated 
to do and hard to debug. Instead, we’ll arrange for our templates to be compiled 
into JavaScript, so they’ll be bundled in our application’s asset bundle, 
the same as all our other JavaScript. We can do this with the Rails plugin 
angular-rails-templates. 
gem "angular-rails-templates" 
gem "sprockets", "~> 2.0"
$ bundle update 
after making this change so that Bundler will update all dependent gems.
$ bundle install
(7)P.125: After we install it with bundle install, we’ll need to add it to 
app/assets/javascripts/application.js. 
//= require angular-rails-templates 
//= require_tree ./templates
assumes our HTML templates are in app/assets/javascripts/templates and 
requires us to add that directory to our application’s JavaScripts bundle as well.
(8)The JavaScript code included with angular-rails-templates is an Angular module 
that our Angular app must depend on (much the way it had to depend on the router).
The name of the included module is templates, so we need to modify our Angular app’s 
dependencies like so
var app = angular.module( 'customers', [ 'ngRoute', 'templates'] );
(9)With that configuration, we can move all the markup inside the outermost 
<article> tags into app/assets/javascripts/templates/customer_search.html. 
We’ll also remove the use of ng-controller from app/views/customers/index.html.erb.
Lastly, we need to add an HTML element there with the ng-view directive. 
This allows Angular to know where to put the view. Ultimately, 
app/views/customers/index.html.erb will look like this:
<article ng-app="customers"> 
  <div ng-view></div> 
</article>
(10)We’ll also need to remove the use of the Rails partials for the pagination 
controls, since Rails partials won’t work inside Angular. We can do this by 
simply inlining the markup, like so: 
<section class="search-results" ng-if="customers.length > 0"> ...
(11)With all that configuration out of the way, Shine should work the same way it 
did before. We can verify this by running our test suite and verifying that 
nothing has broken.
$ bundle exec rake
============================= git clone to another c9.io workstation =======================
!!!!!!! ERROR  #1 !!!!!!!!!!!!!
http://stackoverflow.com/questions/28925848/error-with-postgresql-datababse-is-the-server-running-locally-and-accepting-co
Q: psql: could not connect to server: 
   No such file or directory Is the server running locally and accepting connections 
   on Unix domain socket "/var/run/postgresql/.s.PGSQL.5432"?
A: even though there is clearly a socket with this path available as reported by 
   netstat -lp --protocol=unix | grep postgres
   The problem can be solved by removing the lock file and restarting postgresql. 
   This is definitely less invasive than a purge and re-install.
   $ sudo rm /var/run/postgresql/.s.PGSQL.5432.lock 
   $ sudo service postgresql restart
!!!!!!! ERROR #2  !!!!!!!!!!!!!
FATAL: password authentication failed for user "shine" FATAL: password authentication failed for user "shine"
 you’ll need to create a user 
 Our user will be named shine and have the password shine. 
 We can create it using the command-line app installed with Postgres called createuser. 
 $ createuser --createdb --login -P shine 
 You’ll be prompted for a password, so enter "shine" twice.
!!!!!!! ERROR #3 !!!!!!!!!!!!!
ActiveRecord::NoDatabaseError
FATAL: database "shine_development" does not exist
timchen7:~/ushine (master) $ bundle exec rake db:drop
timchen7:~/ushine (master) $ bundle exec rake db:create
timchen7:~/ushine (master) $ bundle exec rake db:migrate
timchen7:~/ushine (master) $ rails s -b $IP -p $PORT
https://ror1-timchen7.c9users.io/customers WORKS!
