#!/bin/bash

set -eu

sudo apt-get update
sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y ansible unzip

### personal files
cd $HOME
tar xzvf ./personal.tar.gz
find .personal/ -type d | tail -n +2 | sed 's|\.personal/||g' | xargs mkdir -p
cd .personal
find . -type f | sed 's|^\./||g' | xargs -ISRC ln -f $PWD/SRC $HOME/SRC
rm $HOME/personal.tar.gz

### ansible

BRANCH=${BRANCH:-master}

cd /tmp

curl -L https://github.com/cumet04/dotfiles/archive/$BRANCH.zip -o dotfiles.zip
unzip dotfiles.zip
cd dotfiles-$BRANCH/playbook
ansible-playbook -K entry.yaml

### clean home
rm -rf .profile .bash* .landscape .motd_shown
