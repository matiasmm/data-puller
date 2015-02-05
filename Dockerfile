FROM ubuntu:14.04

MAINTAINER Kodemates
 
RUN apt-get -y update
RUN sudo apt-get install -yq php5-cli php-pear php5-dev python-pip python-dev libyaml-dev
RUN sudo apt-get install -yq libgearman-dev gearman-job-server gearman-tools git-core
RUN pecl install gearman

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

ENV PATH /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin
RUN pip install ansible

ADD ansible/inventory /etc/ansible/hosts
ADD ansible/playbook.yml /tmp/playbook.yml
ADD requirements.txt /tmp/requirements.txt
WORKDIR /tmp
RUN ansible-playbook playbook.yml -c local

EXPOSE 15672 15673
WORKDIR /root
ENTRYPOINT ["/bin/bash"]
