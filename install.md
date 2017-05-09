Mac
================================================================================

packages
------------------------------------------------------------
冒頭のsudo trueはパスワード入力回避のため
```
sudo true
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
brew tap caskroom/fonts
brew install $(echo "
    coreutils
    emacs
    git
    go
    hub
    imagemagick
    jq
    lftp
    mysql
    neovim/neovim/neovim
    nmap
    peco
    postgresql
    pyenv
    rbenv
    rsync
    svn
    the_silver_searcher
    tig
    tree
    watch
    zsh-syntax-highlighting
")
brew cask install $(echo "
    amethyst
    docker
    font-source-han-code-jp
    gimp
    google-chrome
    google-drive
    google-japanese-ime
    inkscape
    istat-menus
    iterm2
    noti
    slack
    visual-studio-code
    vlc
    xquartz
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
* ログインシェルの変更
* 自動スリープの停止; 省エネ設定
* GIMP, Inkscapeの初期起動
  - 初回起動はフォント検索で非常に時間がかかるため
* rbenv, pyenvの設定
  - install, global
* command-英かな


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
    github.com/cweill/gotests/...
    github.com/derekparker/delve/cmd/dlv
    github.com/fatih/gomodifytags
    github.com/golang/lint/golint
    github.com/lukehoban/go-outline
    github.com/mattn/memo
    github.com/newhook/go-symbols
    github.com/nsf/gocode
    github.com/rogpeppe/godef
    github.com/tpng/gopkgs
    github.com/zmb3/gogetdoc
    golang.org/x/tools/cmd/godoc
    golang.org/x/tools/cmd/gorename
    golang.org/x/tools/cmd/guru
    sourcegraph.com/sqs/goreturns
")
```
