#!/bin/bash

set -eu

umask 002

sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-pip unzip
pip3 install ansible awscli

### personal files
~/.local/bin/aws s3 cp s3://${PERSONAL_BUCKET}/personal.tar.gz $HOME/
cd $HOME
tar xzvf ./personal.tar.gz
find .personal/ -type d | tail -n +2 | sed 's|\.personal/||g' | xargs mkdir -p
cd .personal
find . -type f | sed 's|^\./||g' | xargs -ISRC ln $PWD/SRC $HOME/SRC
rm personal.tar.gz

### ansible

BRANCH=${BRANCH:-master}

cd /tmp

curl -L https://github.com/cumet04/dotfiles/archive/$BRANCH.zip -o dotfiles.zip
unzip dotfiles.zip
cd dotfiles-$BRANCH/playbook
~/.local/bin/ansible-playbook -K -e ansible_python_interpreter=/usr/bin/python3 entry.yaml
