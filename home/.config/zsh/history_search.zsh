function history_search() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
}
zle -N history_search
bindkey '^r' history_search
