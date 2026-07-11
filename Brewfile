type = ENV.fetch("HOMEBREW_MACHINE_SETUP_CATEGORY").to_sym # personal or work

brew "mise"
brew "stow"
brew "coreutils"
brew "findutils"
brew "tig"
brew "tree"
brew "pwgen"
brew "htop"
brew "colima" # colima は brew services による自動起動のため brew でインストール
brew "ansible"
brew "python" # gcloud-cliが依存する

brew "cask"
cask "gcloud-cli"
cask "visual-studio-code"
cask "google-chrome"
cask "obsidian"
cask "google-japanese-ime"
cask "claude"
cask "ghostty"
cask "logi-options+"
cask "karabiner-elements"
cask "linearmouse"
cask "zed"
cask "hiddenbar"
cask "google-drive"

if type == :personal
  brew "mas"
  mas "Tailscale", id: 1475387142

  cask "resilio-sync"
end

if type == :work
  cask "slack"
end
