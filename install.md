ArchLinux
================================================================================

auraのインストール
------------------------------------------------------------
```
curl -OL https://aur.archlinux.org/cgit/aur.git/snapshot/aura-bin.tar.gz
tar xvf aura-bin.tar.gz
cd aura-bin
makepkg -sri
```


packages
------------------------------------------------------------
### official repository
```
alsa-utils
android-tools
avahi
awesome
bluez
bluez-firmware
bluez-utils
chromium
colordiff
dmidecode
dnsmasq
docker
docker-compose
dosfstools
efibootmgr
emacs-nox
evince
fcitx
fcitx-configtool
fcitx-im
fcitx-mozc
geeqie
gimp
git
go
gptfdisk
grep
gzip
inkscape
intel-ucode
jdk8-openjdk
jq
libreoffice-fresh
mariadb-clients
maven
mesa
mongodb
mongodb-tools
nano
neovim
nodejs
noto-fonts
noto-fonts-cjk
npm
nss-mdns
ntfs-3g
nvidia
openssh
pavucontrol
perl
poppler-data
pulseaudio
pulseaudio-alsa
pulseaudio-bluetooth
python-pip
rsync
ruby
samba
terminator
tmux
tree
ufw
unrar
unzip
vlc
wine
winetricks
xclip
xorg-server
xorg-server-utils
xorg-xinit
zip
zsh-syntax-highlighting
```

以下必要に応じて
```
xf86-video-intel
xf86-video-nouveau
xf86-video-ati
nvidia
```

### AUR
```
aura-bin
btsync
chromium-pepper-flash
peco
pyenv
rbenv
ruby-build
silver-searcher-git
visual-studio-code
```



Mac
================================================================================

packages
------------------------------------------------------------
冒頭のsudo trueはパスワード入力回避のため
```
sudo true
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
brew install $(echo "
zsh
emacs
coreutils
go
homebrew/dupes/rsync
git
svn
neovim/neovim/neovim
peco
pyenv
rbenv
imagemagick
android-platform-tools
tree
the_silver_searcher
")

brew cask install $(echo "
google-chrome
google-japanese-ime
vlc
iterm2
resilio-sync
gimp
visual-studio-code
xquartz
inkscape
docker
")
```

初期設定コマンド
------------------------------------------------------------
```
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
ln -s /usr/local/Cellar/git/2.11.0/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin
sudo echo '/usr/local/bin/zsh' >> /etc/shells && chsh -s /usr/local/bin/zsh
```

その他設定など
--------------------------------------------------
* 自動スリープの停止; 省エネ設定
* Ricty Diminishedを設定
  - webから落とす
* GIMP, Inkscapeの初期起動
  - 初回起動はフォント検索で非常に時間がかかるため
* rbenv, pyenvの設定
  - install, global


### キーボード
* キーリピート
* Functionキーの動作
* 各種ショートカットキー無効化


### iTerm2
* metaキーをoptionに割り当てる
  - Preferences > Profiles > Keys > Left option > +Esc
  - Preferences > Profiles > Keys > Right option > +Esc
* Ctrl + Enterでタブ増やす
* フォント
* カラースキーム
