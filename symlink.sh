#!/bin/bash

# get base dir
cwd=`dirname "${0}"`
expr "${0}" : "/.*" > /dev/null || cwd=`(cd "${cwd}" && pwd)`

rm "$HOME/.bashrc"
ln -s "$cwd/.bashrc" "$HOME/"
ln -s "$cwd/.inputrc" "$HOME/"
ln -s "$cwd/.xprofile" "$HOME/"
ln -s "$cwd/.gitconfig" "$HOME/"
ln -s "$cwd/.gitignore" "$HOME/"
ln -s "$cwd/.tmux.conf" "$HOME/"
ln -s "$cwd/.vim" "$HOME/"
ln -s "$cwd/.emacs.d" "$HOME/"
ln -s "$cwd/.fonts" "$HOME/"
mkdir "$HOME/.config"
ln -s "$cwd/.config/awesome" "$HOME/.config/"
ln -s "$cwd/.config/lxterminal" "$HOME/.config/"
ln -s "$cwd/.config/powerline-shell.py" "$HOME/.config/"

fc-cache -fv
