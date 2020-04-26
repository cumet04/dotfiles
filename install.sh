#!/bin/bash

set -eu

sudo apt-get update
sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y ansible unzip

### install awscli v2
cd /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

### personal files
aws s3 cp s3://${PERSONAL_BUCKET}/personal.tar.gz $HOME/
cd $HOME
tar xzvf ./personal.tar.gz
find .personal/ -type d | tail -n +2 | sed 's|\.personal/||g' | xargs mkdir -p
cd .personal
find . -type f | sed 's|^\./||g' | xargs -ISRC ln $PWD/SRC $HOME/SRC
rm $HOME/personal.tar.gz

### ansible

BRANCH=${BRANCH:-master}

cd /tmp

curl -L https://github.com/cumet04/dotfiles/archive/$BRANCH.zip -o dotfiles.zip
unzip dotfiles.zip
cd dotfiles-$BRANCH/playbook
ansible-playbook -K entry.yaml
