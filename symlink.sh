#!/bin/bash

# get base dir
cwd=`dirname "${0}"`
expr "${0}" : "/.*" > /dev/null || cwd=`(cd "${cwd}" && pwd)`

rm "$HOME/.bashrc" 2> /dev/null
for target in $(echo "
    .emacs.d
    .gitconfig
    .ideavimrc
    .zshrc
");do ln -sf "$cwd/$target" "$HOME/";done

mkdir "$HOME/.config"
for target in $(echo "
    gitignore_global
    nvim
");do ln -sf "$cwd/.config/$target" "$HOME/.config";done

mkdir $HOME/.config/zsh
ln -sf "$cwd/.config/zsh/functions.zsh" .config/zsh/
mkdir -p $HOME/.config/inkscape/keys

cp /Applications/Inkscape.app/Contents/Resources/share/inkscape/keys/adobe-illustrator-cs2.xml $HOME/.config/inkscape/keys/default.xml

echo "finish install"
