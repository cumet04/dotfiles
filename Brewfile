type = ENV.fetch("HOMEBREW_MACHINE_SETUP_CATEGORY").to_sym # personal or work

brew "mise"
brew "stow"
brew "coreutils"
brew "findutils"
brew "tig"
brew "tree"
brew "pwgen"
brew "htop"

# colima は brew services による自動起動のため brew でインストール
brew "colima"

brew "cask"
cask "gcloud-cli"
cask "visual-studio-code"
cask "google-chrome"
cask "obsidian"
cask "resilio-sync" if type == :personal
cask "google-japanese-ime"
cask "claude"
cask "ghostty"
cask "logi-options+"
cask "karabiner-elements"
cask "linearmouse"
cask "google-drive" if type == :work
cask "slack" if type == :work

brew "ansible"

if type == :personal
  brew "mas"
  mas "Tailscale", id: 1475387142
end
