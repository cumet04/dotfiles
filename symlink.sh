#!/bin/bash

# get base dir
cwd=`dirname "${0}"`
expr "${0}" : "/.*" > /dev/null || cwd=`(cd "${cwd}" && pwd)`

rm "$HOME/.bashrc" 2> /dev/null
for target in $(echo "
    .emacs.d
    .gitconfig
    .gtkrc-2.0
    .ideavimrc
    .xinitrc
    .Xmodmap
    .zshrc
");do ln -sf "$cwd/$target" "$HOME/";done

mkdir "$HOME/.config"
for target in $(echo "
    awesome
    gitignore_global
    nvim
    systemd
    terminator
");do ln -sf "$cwd/.config/$target" "$HOME/.config";done

mkdir $HOME/.config/zsh
mkdir -p $HOME/.config/inkscape/keys

cp /usr/share/inkscape/keys/adobe-illustrator-cs2.xml $HOME/.config/inkscape/keys/default.xml
# cp /Applications/Inkscape.app/Contents/Resources/share/inkscape/keys/adobe-illustrator-cs2.xml $HOME/.config/inkscape/keys/default.xml

sudo ln -s /usr/share/git/diff-highlight/diff-highlight /usr/local/bin/
sudo ln -s /etc/fonts/conf.avail/10-unhinted.conf /etc/fonts/conf.d/
sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps /etc/fonts/conf.d/
sudo -k

echo "finish install"
