django-vagrant-template
=======================

A template for new Django 1.5 projects developed under Vagrant. Features offered include:

* A Vagrantfile for building an Ubuntu 12.04 based VM
* puppet provisioning for python, mysql and other useful boilerplate stuff
* managed project dependencies trough a requirements.txt file that gets installed on vagrant up
* gunicorn and gunicorn websocket for lightweight request processing
* A MySQL server and database (with the same name as the project, pre-configured in the project settings file)
* Separation of configuration settings into base.py, dev.py and production.py (and optionally local.py, kept outside
  of version control) as per http://www.sparklewise.com/django-settings-for-production-and-development-best-practices/
* South, django-compressor, django-debug-toolbar and more out of the box (see requirements.txt for more details)
* A boilerplate base template with jquery included, and various other ideas and best practices borrowed from https://github.com/h5bp/html5-boilerplate
* A boilerplate base template with twitter bootstrap included from https://github.com/jonfaustman/django-frontend-skeleton
* sphinx documentation support is included as well

Setup
-----
Install Django 1.5 on your host machine. To start a new project, run the following commands:

::

    django-admin.py startproject --template https://github.com/sassman/django-vagrant-template/zipball/master --name=Vagrantfile <your-project-name>
    cd <your-project-name>
    vagrant up      # this can take a while on the first setup run, be patient
    vagrant ssh

    #  (then, within the SSH session:)
    cd $HOME/<your-project-name>
    runserver   # comes from a nice bash alias


WebServer Access
----------------

This will make the app accessible on the host machine as http://localhost:8000/ . The codebase is located on the host
machine, exported to the VM as a shared folder (under linux via NFS); code editing and Git operations will generally be done on the host.

runserver will utilize the django runserver and not yet the gunicorn server.


MySQL Access
------------

you can also easily access the mysql database from your localmachine. Of course the default port 3306 from mysql gets forwared to your machine. mysql://localhost:3306
You should be able to connect with the `project_name` user account or with root (without a password).

