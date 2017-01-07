#!/bin/bash

# get base dir
cwd=`dirname "${0}"`
expr "${0}" : "/.*" > /dev/null || cwd=`(cd "${cwd}" && pwd)`

rm "$HOME/.bashrc"
ln -s "$cwd/.zshrc" "$HOME/"
ln -s "$cwd/.xinitrc" "$HOME/"
ln -s "$cwd/.gitconfig" "$HOME/"
ln -s "$cwd/.tmux.conf" "$HOME/"
ln -s "$cwd/.ideavimrc" "$HOME/"
ln -s "$cwd/.emacs.d" "$HOME/"
ln -s "$cwd/.subversion" "$HOME/"
mkdir "$HOME/.config"
ln -s "$cwd/.config/nvim" "$HOME/.config/"
ln -s "$cwd/.config/awesome" "$HOME/.config/"
ln -s "$cwd/.config/gitignore_global" "$HOME/.config/"

cp /usr/share/inkscape/keys/adobe-illustrator-cs2.xml $HOME/.config/inkscape/keys/default.xml
# cp /Applications/Inkscape.app/Contents/Resources/share/inkscape/keys/adobe-illustrator-cs2.xml $HOME/.config/inkscape/keys/default.xml

sudo ln -s /etc/fonts/conf.avail/10-unhinted.conf /etc/fonts/conf.d/
sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps /etc/fonts/conf.d/
sudo -k

echo "finish install"
