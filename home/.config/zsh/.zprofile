# 環境変数系なのでzshenvに置くのが正常かと思いきや、Macの場合は /etc/zprofile にある path_helper が後勝ちでPATHを壊してしまうので
# 仕方なくPATHだけprofileで指定する

# /opt/homebrew/bin は /etc/paths.d/homebrew (pkgインストーラが作る) 由来で PATH に入るが、
# path_helper の仕様でシステムパスより後ろになり brew の python3 等が OS 標準に負ける。
# そのため Homebrew 公式の作法 (brew shellenv) で先頭に足し直す。後方の重複は typeset -U が消す。
eval "$(/opt/homebrew/bin/brew shellenv)"

typeset -U path PATH
path=(
  /opt/homebrew/opt/findutils/libexec/gnubin
  /opt/homebrew/opt/coreutils/libexec/gnubin
  $HOME/.local/bin
  $HOME/dotfiles/shell_commands
  $HOME/.local/share/mise/shims
  $path
)
