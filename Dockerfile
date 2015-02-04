FROM ubuntu:14.04

MAINTAINER Kodemates
 
RUN apt-get -y update
RUN sudo apt-get install -yq php5-cli php-pear php5-dev python-pip python-dev
RUN sudo apt-get install -yq libgearman-dev gearman-job-server gearman-tools
RUN pecl install gearman
        


ENV PATH /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin
RUN pip install ansible

ADD ansible/inventory /etc/ansible/hosts
ADD ansible/playbook.yml /tmp/playbook.yml
WORKDIR /tmp
RUN ansible-playbook playbook.yml -c local

EXPOSE 15672 15673
WORKDIR /root
ENTRYPOINT ["/bin/bash"]
