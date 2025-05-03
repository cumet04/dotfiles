#!/bin/bash

cd $(dirname $0)

echo "add gh repo"
KEYPATH=/etc/apt/keyrings/githubcli-archive-keyring.gpg
sudo mkdir -p $(dirname $KEYPATH)
sudo curl https://cli.github.com/packages/githubcli-archive-keyring.gpg -o $KEYPATH
echo "deb [arch=$(dpkg --print-architecture) signed-by=$KEYPATH] https://cli.github.com/packages stable main" | \
  sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

echo "apt-get update"
sudo apt-get update

echo "apt-get install ..."
sudo apt-get install -y colordiff direnv zsh jq neovim tig gh


# devcontainer create .config AFTER this script run.
# So 'ln -s $PWD/home/.config $HOME/.config' doesn't work.
mkdir -p $HOME/.config
CONF_ROOT=$PWD/home/.config
ls -1 $CONF_ROOT | xargs -ISRC ln -s $CONF_ROOT/SRC $HOME/.config/

sudo chsh -s /usr/bin/zsh "$USER"
if ! grep -q '^export ZDOTDIR=$HOME/.config/zsh' /etc/zsh/zshenv; then
  echo 'export ZDOTDIR=$HOME/.config/zsh' | sudo tee -a /etc/zsh/zshenv
fi
git submodule init
git submodule update

### WSL setup
test -z "$WSL_DISTRO_NAME" && exit

sudo env DEBIAN_FRONTEND=noninteractive apt-get install -y ansible wslu

git submodule update --init # for zsh plugins

# wslvar clean tty, so confine it to 'bash -c'
# MEMO: `$(wslvar USERPROFILE | xargs wslpath)` doesn't work somehow
bash -c 'wslpath $(wslvar USERPROFILE) | xargs -ISRC sudo ln -s SRC /opt/winhome'

cd $PWD/playbook
ansible-playbook -K -c local -i localhost, entry.yaml
