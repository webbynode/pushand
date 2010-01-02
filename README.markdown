pushand
=======

A tiny set of BASH scripts that makes it easy to **push** a git repository **and** ... do something!

If you setup pushand, your server will accept pushes from arbitrary git repositories and, if a `.pushand` script exists in the root of the pushed repository, it will run that script on the server.

That's all!

Install
-------

    $ git clone git://github.com/remi/pushand.git
    $ cd pushand
    $ sudo ./pushand_server_install

To uninstall, you can run `sudo ./pushand_server_uninstall`

Usage
-----

    $ mkdir random-repo
    $ cd random-repo
    $ git init
    $ vi .pushand

      #! /bin/bash
      echo "Hello from .pushand ... this file is $0"

    $ chmod +x .pushand
    $ git add .
    $ git commit -a -m "init repo"
    $ git remote add origin remi@localhost:/home/remi/random-repo.git
    $ git push origin master
    Counting objects: 3, done.
    Writing objects: 100% (3/3), 238 bytes, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To remi@localhost:/home/remi/random-repo.git
     * [new branch]      master -> master
     Checked out master branch
     Hello from .pushand ... this file is /home/remi/random-repo.git/.pushand
