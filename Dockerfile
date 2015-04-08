FROM ubuntu:14.04

MAINTAINER Kodemates
 
ENV PATH /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin
ENV PYTHONIOENCODING utf8

RUN apt-get -y update
RUN sudo apt-get install -yq python3-pip python3-dev python-pip python-dev libyaml-dev tmux
RUN sudo apt-get install -yq libgearman-dev gearman-job-server gearman-tools git-core

RUN easy_install -U pip
RUN pip install ansible

ENV PLAYBOOK_DIR /tmp/ansible/
ADD ansible/inventory /etc/ansible/hosts
ADD ansible /tmp/ansible
ADD requirements.txt /tmp/ansible/requirements.txt
WORKDIR /tmp/ansible
RUN ansible-playbook playbook.yml -c local

WORKDIR /root
VOLUME ["/data/db"]
ENTRYPOINT ["/bin/bash"]
