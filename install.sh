#!/bin/bash

cd $(dirname $0)

sudo apt-get update
sudo apt-get install -y colordiff direnv fish jq neovim peco tig wslu

# devcontainer create .config AFTER this script run.
# So 'ln -s $PWD/home/.config $HOME/.config' doesn't work.
mkdir -p $HOME/.config
CONF_ROOT=$PWD/home/.config
ls -1 $CONF_ROOT | xargs -ISRC ln -s $CONF_ROOT/SRC $HOME/.config/


### WSL setup
test -z "$WSL_DISTRO_NAME" && exit

sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y ansible

# wslvar clean tty, so confine it to 'bash -c'
# MEMO: `$(wslvar USERPROFILE | xargs wslpath)` doesn't work somehow
bash -c 'wslpath $(wslvar USERPROFILE) | xargs -ISRC sudo ln -s SRC /opt/winhome'

cd $PWD/playbook
ansible-playbook -K -c local -i localhost, entry.yaml

echo '##### setup done #####'
echo 'ToDo:'
echo '  - put $HOME/.gitconfig'
echo '  - gh auth login'
echo '  - put aws config/credentials; https://zenn.dev/cumet04/scraps/1a9861bc18bea7#comment-c67e8908869d49'
