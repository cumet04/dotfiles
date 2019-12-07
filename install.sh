#!/bin/bash

BRANCH=${BRANCH:-master}
umask 022

mkdir /tmp/dotfiles-install; cd /tmp/dotfiles-install

sudo apt-get update
sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip unzip
pip3 install ansible

curl -L https://github.com/cumet04/dotfiles/archive/$BRANCH.zip -o dotfiles.zip
unzip dotfiles.zip
cd dotfiles-$BRANCH/playbook
~/.local/bin/ansible-playbook -i localhost, -c local -e ansible_python_interpreter=/usr/bin/python3 entry.yaml

sudo chsh -s $(which fish) medalhkr
