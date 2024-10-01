function tig_status() {
  # tigは何故か普通に実行すると"tig: ignoring stdin." と出て終了してしまう。
  # そのため関数内でtigを実行せずにコマンドをbufferに入れてから実行させる。
  BUFFER="tig status"
  zle accept-line
}
stty -ixon # ^Sを消すにはこちらも必要
zle -N tig_status
bindkey '^S' tig_status
