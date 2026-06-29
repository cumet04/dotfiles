#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"
DOTFILES_ROOT=$HOME/dotfiles

BREW_ENV_FILE="$HOME/.config/homebrew/brew.env"
if [[ ! -f "$BREW_ENV_FILE" ]]; then
  read -r -p "Machine category (personal/work): " category
  mkdir -p "$(dirname "$BREW_ENV_FILE")"
  echo "HOMEBREW_MACHINE_SETUP_CATEGORY=$category" > "$BREW_ENV_FILE"
fi

echo "==> ZDOTDIR (/etc/zshenv)"
ZDOTDIR_LINE='export ZDOTDIR=$HOME/.config/zsh'
if ! sudo grep -qsF "$ZDOTDIR_LINE" /etc/zshenv 2>/dev/null; then
  echo "$ZDOTDIR_LINE" | sudo tee -a /etc/zshenv >/dev/null
  # ref https://github.com/ghostty-org/ghostty/blob/main/src/shell-integration/README.md#zsh
  echo "test -n $GHOSTTY_RESOURCES_DIR && source "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration" | sudo tee -a /etc/zshenv >/dev/null
  echo "appended ZDOTDIR to /etc/zshenv"
fi

echo "==> Touch ID for sudo (/etc/pam.d/sudo_local)"
if [[ ! -f /etc/pam.d/sudo_local ]]; then
  cat /etc/pam.d/sudo_local.template | sed 's/^#auth/auth/' | sudo tee /etc/pam.d/sudo_local >/dev/null
fi

echo "==> macOS defaults"
# キーリピートを最速化（反映にはログアウト/再起動が必要）。
defaults write -g KeyRepeat -int 2          # リピート間隔: 1 が最速（GUI最速は 2）
defaults write -g InitialKeyRepeat -int 15  # リピート開始までの時間: 10（GUI最速は 15）
defaults write -g ApplePressAndHoldEnabled -bool false  # 長押しのアクセント文字メニューを無効化

echo "==> brew bundle"
eval "$(/opt/homebrew/bin/brew shellenv)" # brewコマンドのPATHを通す
./brew-bundle

echo "==> git submodules (zsh plugins)"
git submodule update --init

echo "==> symlink ~/.config/* (stow)"
mkdir -p "$HOME/.config"
stow --dir="$DOTFILES_ROOT/home" --target="$HOME/.config" --restow .config

echo "==> mise install"
mise install

echo "==> colima (docker daemon)"
brew services restart colima

echo "==> repos dir (for repo_look)"
mkdir -p "$HOME/repos/github.com/cumet04"
ln -sfn "$DOTFILES_ROOT" "$HOME/repos/github.com/cumet04/dotfiles"

echo "==> done."

# TODO:
# - claude-sync
