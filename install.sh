#!/bin/bash

BRANCH=${BRANCH:-master}

mkdir /tmp/dotfiles-install; cd /tmp/dotfiles-install

sudo apt-get update
sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y ansible unzip
curl -L https://github.com/cumet04/dotfiles/archive/$BRANCH.zip -o dotfiles.zip
unzip dotfiles.zip
cd dotfiles-$BRANCH/playbook
ansible-playbook -i localhost, -c local entry.yaml

sudo chsh -s $(which fish) medalhkr
