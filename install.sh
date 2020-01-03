#!/bin/bash

BRANCH=${BRANCH:-master}

cd /tmp

sudo apt-get update
sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip unzip
pip3 install ansible

curl -L https://github.com/cumet04/dotfiles/archive/$BRANCH.zip -o dotfiles.zip
unzip dotfiles.zip
cd dotfiles-$BRANCH/playbook
~/.local/bin/ansible-playbook -K -e ansible_python_interpreter=/usr/bin/python3 entry.yaml
