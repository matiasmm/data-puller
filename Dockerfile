FROM ubuntu:14.04

MAINTAINER Kodemates
 
ENV PATH /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin
ENV PYTHONIOENCODING utf8

RUN apt-get -y update
RUN sudo apt-get install -yq python3-pip python3-dev python-pip python-dev libyaml-dev tmux
RUN sudo apt-get install -yq libgearman-dev gearman-job-server gearman-tools git-core

RUN pip install ansible

WORKDIR /tmp
ADD ansible/inventory /etc/ansible/hosts
ADD ansible/playbook.yml /tmp/playbook.yml
ADD requirements.txt /tmp/requirements.txt
RUN ansible-playbook playbook.yml -c local

WORKDIR /root
ENTRYPOINT ["/bin/bash"]
