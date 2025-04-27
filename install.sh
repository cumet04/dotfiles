#!/bin/bash

cd $(dirname $0)

sudo apt-get update
sudo apt-get install -y colordiff direnv zsh jq neovim tig

# devcontainer create .config AFTER this script run.
# So 'ln -s $PWD/home/.config $HOME/.config' doesn't work.
mkdir -p $HOME/.config
CONF_ROOT=$PWD/home/.config
ls -1 $CONF_ROOT | xargs -ISRC ln -s $CONF_ROOT/SRC $HOME/.config/

sudo chsh -s /usr/bin/zsh "$USER"
if ! grep -q '^export ZDOTDIR=$HOME/.config/zsh' /etc/zsh/zshenv; then
  echo 'export ZDOTDIR=$HOME/.config/zsh' | sudo tee -a /etc/zsh/zshenv
fi

### WSL setup
test -z "$WSL_DISTRO_NAME" && exit

sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y ansible wslu

git submodule update --init # for zsh plugins

# wslvar clean tty, so confine it to 'bash -c'
# MEMO: `$(wslvar USERPROFILE | xargs wslpath)` doesn't work somehow
bash -c 'wslpath $(wslvar USERPROFILE) | xargs -ISRC sudo ln -s SRC /opt/winhome'

cd $PWD/playbook
ansible-playbook -K -c local -i localhost, entry.yaml
