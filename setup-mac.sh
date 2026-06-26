#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"
DOTFILES_ROOT="$PWD"

echo "==> macOS defaults"
# キーリピートを最速化（反映にはログアウト/再起動が必要）。
defaults write -g KeyRepeat -int 2          # リピート間隔: 1 が最速（GUI最速は 2）
defaults write -g InitialKeyRepeat -int 15  # リピート開始までの時間: 10（GUI最速は 15）
defaults write -g ApplePressAndHoldEnabled -bool false  # 長押しのアクセント文字メニューを無効化

echo "==> brew bundle"
brew bundle --file="$DOTFILES_ROOT/Brewfile"

echo "==> git submodules (zsh plugins)"
git submodule update --init

echo "==> symlink ~/.config/* (stow)"
mkdir -p "$HOME/.config"
stow --dir="$DOTFILES_ROOT/home" --target="$HOME/.config" --restow .config

echo "==> ZDOTDIR (/etc/zshenv)"
ZDOTDIR_LINE='export ZDOTDIR=$HOME/.config/zsh'
if ! sudo grep -qsF "$ZDOTDIR_LINE" /etc/zshenv 2>/dev/null; then
  echo "$ZDOTDIR_LINE" | sudo tee -a /etc/zshenv >/dev/null
  echo "export MACHINE_SETUP_CATEGORY= # personal or work" | sudo tee -a /etc/zshenv >/dev/null
  echo "appended ZDOTDIR to /etc/zshenv"
  echo "NOTE: /etc/zshenvのMACHINE_SETUP_CATEGORYの値を埋めること"
fi

echo "==> mise install"
mise install

echo "==> colima (docker daemon)"
brew services start colima

echo "==> repos dir (for repo_look)"
mkdir -p "$HOME/repos/github.com/cumet04"
ln -sfn "$DOTFILES_ROOT" "$HOME/repos/github.com/cumet04/dotfiles"

echo "==> done."

# TODO:
# - claude-sync
