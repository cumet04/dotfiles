#!/bin/bash

# get base dir
cwd=`dirname "${0}"`
expr "${0}" : "/.*" > /dev/null || cwd=`(cd "${cwd}" && pwd)`

ln -s "$cwd/.bashrc" "$HOME/"
ln -s "$cwd/.gitconfig" "$HOME/"
ln -s "$cwd/.gitignore" "$HOME/"
ln -s "$cwd/.tmux.conf" "$HOME/"
ln -s "$cwd/.vim" "$HOME/"
ln -s "$cwd/.emacs.d" "$HOME/"
ln -s "$cwd/.fonts" "$HOME/"
ln -s "$cwd/.config/awesome" "$HOME/.config/"

fc-cache -fv
