Vagrant sandbox
===============

    vagrant up
    vagrant ssh

Using screen you can run these scripts in different consoles:

    python /vagrant/test/client.py
    python /vagrant/test/worker.py


Installation
============

Build docker image:

    docker build -t datapuller .

Create a container:

    docker run -ti -v $(pwd):/opt/app datapuller


docker run -d -p 27017:27017 -v <db-dir>:/data/db --name mongodb dockerfile/mongodb
