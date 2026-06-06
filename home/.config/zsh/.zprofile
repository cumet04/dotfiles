# 環境変数系なのでzshenvに置くのが正常かと思いきや、Macの場合は /etc/zprofile にある path_helper が後勝ちでPATHを壊してしまうので
# 仕方なくPATHだけprofileで指定する
typeset -U path PATH
path=(
  /opt/homebrew/opt/findutils/libexec/gnubin
  /opt/homebrew/opt/coreutils/libexec/gnubin
  $HOME/.local/bin
  $HOME/dotfiles/shell_commands
  $HOME/.local/share/mise/shims
  $path
)
