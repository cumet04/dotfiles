#!/bin/bash

sudo apt-get update
sudo apt-get install -y colordiff direnv fish git jq neovim peco tig

# devcontainer create .config AFTER this script run.
# So 'ln -s $PWD/home/.config $HOME/.config' doesn't work.
mkdir -p $HOME/.config
CONF_ROOT=$(pwd -P)/home/.config
ls -1 $CONF_ROOT | xargs -ISRC ln -s $CONF_ROOT/SRC $HOME/.config/


### WSL setup
test -z "$WSLENV" && exit

sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y ansible

sudo ln -s (wslpath (wslvar USERPROFILE)) /opt/winhome # install windows home

BRANCH=${BRANCH:-master}
git clone -b $BRANCH https://github.com/cumet04/dotfiles $HOME/dotfiles

cd $HOME/dotfiles/playbook
ansible-playbook -K -c local -i localhost, entry.yaml

echo '##### setup done #####'
echo 'ToDo:'
echo '  - put $HOME/.gitconfig'
