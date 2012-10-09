Heroku

# Installation

https://toolbelt.heroku.com/

1. wget -qO- https://toolbelt.heroku.com/install.sh | sh
2. gem install heroku foreman

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
    
# Some command lines
    $ heroku run rake db:create
    $ heroku run rake db:migrate
    
# Asset Precompile

1. Compiling assets locally.
    RAILS_ENV=production bundle exec rake assets:precompile
    git add public/assets
    git commit -m "vendor compiled assets"

2. Compiling assets during slug compilation.
    config.assets.initialize_on_precompile=false

3. Compiling assets during runtime.
    If the assets:precompile task fails, the output will be displayed and runtime compilation of assets will be enabled.    

# Heroku Environment Variables
    heroku config:add KEY=value
    heroku config

References
https://devcenter.heroku.com/articles/rails3
http://railsapps.github.com/rails-heroku-tutorial.html
https://devcenter.heroku.com/articles/ruby