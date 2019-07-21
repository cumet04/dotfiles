#!/bin/bash

BRANCH=${BRANCH:-master}

mkdir /tmp/dotfiles-install; cd /tmp/dotfiles-install

sudo apt-get update
env DEBIAN_FRONTEND=noninteractive sudo apt-get install -y ansible unzip
curl -L https://github.com/cumet04/dotfiles/archive/$BRANCH.zip -o dotfiles.zip
unzip dotfiles.zip
cd dotfiles-$BRANCH/playbook
ansible-playbook -i localhost, -c local entry.yaml

chsh -s $(which fish) medalhkr
