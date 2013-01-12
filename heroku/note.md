Heroku

# Installation

https://toolbelt.heroku.com/

wget -qO- https://toolbelt.heroku.com/install.sh | sh

    $ heroku login
    Enter your Heroku credentials.
    Email: chamnapchhorn@gmail.com
    Password:
    Could not find an existing public key.
    Would you like to generate one? [Yn]
    Generating new SSH public key.
    Uploading ssh public key /Users/adam/.ssh/id_rsa.public

# Create a Rails 3 App
    $ cd ~/myapp
    $ heroku create pg_backbone
    Creating pg_backbone... done, stack is cedar
    http://pg_backbone.herokuapp.com/ | git@heroku.com:pg_backbone.git
    Git remote heroku added
    $ heroku run rake db:create
    $ heroku run rake db:migrate

# For existing project which has just been cloned
    $ git remote add heroku git@heroku.com:<app_name>.git
    
# Asset Precompile

1. Compiling assets locally.
    $ RAILS_ENV=production bundle exec rake assets:precompile
    $ git add public/assets
    $ git commit -m "vendor compiled assets"

2. Compiling assets during slug compilation.
    config.assets.initialize_on_precompile=false

3. Compiling assets during runtime.
    If the assets:precompile task fails, the output will be displayed and runtime compilation of assets will be enabled.    

# Heroku Environment Variables
    $ heroku config:add KEY=value
    $ heroku config

# Counting database rows
    $ heroku pg:info
    $ heroku pg:psql <DATABASE_URL>
    > SELECT schemaname,relname,n_live_tup 
    FROM pg_stat_user_tables 
    ORDER BY n_live_tup DESC;
    > SELECT sum(n_live_tup) FROM pg_stat_user_tables;

# Running tasks in background

Using `heroku run:detached` to run a process in background. Check your logs to view output from these commands:

    $ heroku run:detached rake db:migrate
    Running `rake db:migrate` detached... up, run.4839
    Use `heroku logs -p run.4839` to view the output.
    $ heroku logs -p run.4839

You can check your current running processes using `heroku ps`:

    $ heroku ps
    === web: `bundle exec thin start -p $PORT -e production`
    web.1: up for 8h
    web.2: up for 3m

    === worker: `bundle exec stalk worker.rb`
    worker.1: up for 1m

If you wish to stop a running process, use `heroku ps:stop` with the name of the process you want to stop and its host dyno will be terminated.

    $ heroku ps:stop run.1
    Stopping run.1 process... done

# Addons

    $ heroku addons:open scheduler
    $ heroku addons:add scheduler:standard
    $ heroku addons:remove newrelic:standard


References
https://devcenter.heroku.com/articles/rails3
http://railsapps.github.com/rails-heroku-tutorial.html
https://devcenter.heroku.com/articles/ruby
https://devcenter.heroku.com/articles/managing-add-onshttps://devcenter.heroku.com/articles/managing-add-ons
https://devcenter.heroku.com/articles/scheduler#inspecting-output
https://devcenter.heroku.com/articles/oneoff-admin-ps#running-tasks-in-background