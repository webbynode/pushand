PHD
===

**NOT COMPLETE**

PHD gives you Passenger-based Heroku-like Deployment.

If you have Passenger installed on a desktop/server, you should be able to:

    $ sudo gem install phd
    $ sudo phd_server_setup

And then, from another machine, you should be able to:

    $ cd my-git-directory-with-a-Rails-or-Rack-application
    $ git remote add my-server admin@my-remote-server.com

Now all you need to do is create a `.pushand` file in the root of your 
application (which specifies commands that will be run on the server):

    $ echo 'phd $0 myapp.myserver.com' > .pushand
    $ git commit -a -m "added .pushand for PHD deployment"

Now, when you can push your repo to the server and it'll detect 
your Rails/Rack application, set it up on passenger, and run it!

    $ git push my-server master

That's it!  http://myapp.myserver.com should work (assuming you setup the DNS)
