ArchLinux
================================================================================
* mozc
* font

pacstrap
------------------------------------------------------------
`pacstrap /mnt base`

時短のためbaseだけに留める

arch-chroot
------------------------------------------------------------
* multilib


initial script
------------------------------------------------------------
choose:
```
xf86-video-intel
xf86-video-nouveau
xf86-video-ati
nvidia
```

```
# install packages
pacman -Syu $(echo "
    base-devel
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
")

# add user
useradd -m -g users medalhkr -s /usr/bin/zsh

# install aura
curl -OL https://aur.archlinux.org/cgit/aur.git/snapshot/aura-bin.tar.gz
tar xvf aura-bin.tar.gz
cd aura-bin
sudo -u medalhkr makepkg -sr
pacman -U aura-bin*pkg.tar.xz

# install AUR packages
yes | aura -A $(echo "
    peco
    pyenv
    pepper-flash
    rbenv
    ruby-build
    silver-searcher-git
    visual-studio-code
")
```

initial script (after login)
------------------------------------------------------------
```
# install latest python 2/3 stable
pyenv install $(pyenv install --list | grep -e "^\s*2[\.0-9]*$" | tail -n 1)
pyenv install $(pyenv install --list | grep -e "^\s*3[\.0-9]*$" | tail -n 1)
pyenv global $(pyenv versions | grep -e "^\s*3") $(pyenv versions | grep -e "^\s*2") 

pip install pylint

# setup golang env
go get -u -v $(echo "
    github.com/nsf/gocode
    github.com/rogpeppe/godef
    github.com/zmb3/gogetdoc
    github.com/golang/lint/golint
    github.com/lukehoban/go-outline
    sourcegraph.com/sqs/goreturns
    golang.org/x/tools/cmd/godoc
    golang.org/x/tools/cmd/gorename
    github.com/tpng/gopkgs
    github.com/newhook/go-symbols
    golang.org/x/tools/cmd/guru
    github.com/cweill/gotests/...
    github.com/derekparker/delve/cmd/dlv
")
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
    emacs
    coreutils
    hub
    go
    rsync
    git
    svn
    neovim/neovim/neovim
    peco
    pyenv
    rbenv
    imagemagick
    tree
    the_silver_searcher
    zsh-syntax-highlighting
")

brew cask install $(echo "
    google-chrome
    google-japanese-ime
    vlc
    iterm2
    gimp
    visual-studio-code
    xquartz
    inkscape
    docker
    atom
    slack
")
```

初期設定コマンド
------------------------------------------------------------
```
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
ln -s /usr/local/Cellar/git/*/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin
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
