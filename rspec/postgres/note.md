Here are the steps to install `postgres` on your ubuntu server. You can checkout https://help.ubuntu.com/community/PostgreSQL, http://www.postgresql.org/download/ for more details.
    
    For ubuntu under 12.04
    $ sudo add-apt-repository ppa:pitti/postgresql
    $ sudo apt-get update

    $ sudo apt-get install -y postgresql-server-dev-9.1 postgresql-client-9.1 libpq-dev postgresql-9.1 postgresql-contrib-9.1

    # when postgres can't start
    $ sudo pg_createcluster 9.1 main --start

    # set locale on ubuntu
    $ export LANGUAGE=en_US.UTF-8
    $ export LANG=en_US.UTF-8
    $ export LC_ALL=en_US.UTF-8

    # put the above export in ~/.bashrc
    $ locale-gen en_US.UTF-8
    $ sudo apt-get install locales
    $ dpkg-reconfigure locales

Create user
    $ sudo -u postgres createuser --superuser <$USER>
    $ sudo -u postgres psql
    $ postgres=# \password <$USER>

Creating rails application with postgres

    $ rails new store -d postgresql
    $ rake db:create