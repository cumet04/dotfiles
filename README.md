ubuntu
----
```
sudo apt-get update
rm -rf ~/.config

export PERSONAL_BUCKET=xxxx
export BRANCH=master
curl -s https://raw.githubusercontent.com/cumet04/dotfiles/$BRANCH/install.sh | bash
```
