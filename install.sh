#!/bin/bash

# get base dir
cwd=`dirname "${0}"`
expr "${0}" : "/.*" > /dev/null || cwd=`(cd "${cwd}" && pwd)`

rm "$HOME/.bashrc"
for target in $(echo "
    .emacs.d
    .gitconfig
    .gtkrc-2.0
    .ideavimrc
    .xinitrc
    .Xmodmap
    .zshrc
");do ln -s "$cwd/$target" "$HOME/"

mkdir "$HOME/.config"
for target in $(echo "
    awesome
    gitignore_global
    nvim
    systemd
    terminator
");do ln -s "$cwd.config/$target" "$HOME/.config"

cp /usr/share/inkscape/keys/adobe-illustrator-cs2.xml $HOME/.config/inkscape/keys/default.xml
# cp /Applications/Inkscape.app/Contents/Resources/share/inkscape/keys/adobe-illustrator-cs2.xml $HOME/.config/inkscape/keys/default.xml

sudo ln -s /etc/fonts/conf.avail/10-unhinted.conf /etc/fonts/conf.d/
sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps /etc/fonts/conf.d/
sudo -k

echo "finish install"
