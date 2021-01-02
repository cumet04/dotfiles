#!/bin/bash

set -eu

test -f ./personal.tar*

sudo apt-get update
sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y ansible unzip

### setup home
sudo ln -s (wslpath (wslvar USERPROFILE)) /opt/winhome
rm -rf .profile .bash* .landscape .motd_shown

### personal files
cd $HOME
tar xf ./personal.tar* # S3 web console omits `.gz`
find .personal/ -type d | tail -n +2 | sed 's|\.personal/||g' | xargs mkdir -p
cd .personal
find . -type f | sed 's|^\./||g' | xargs -ISRC ln -f $PWD/SRC $HOME/SRC
rm $HOME/personal.tar.gz

### ansible
BRANCH=${BRANCH:-main}

cd /tmp

curl -L https://github.com/cumet04/dotfiles/archive/$BRANCH.zip -o dotfiles.zip
unzip dotfiles.zip
cd dotfiles-$BRANCH/playbook
ansible-playbook -K entry.yaml

