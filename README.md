Installation
============

Build docker image:

    docker build -t datapuller .

Create a container:

    docker run -ti -v $(pwd):/opt/app datapuller
