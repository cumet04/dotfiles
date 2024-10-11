function history_search() {
  BUFFER=$(fc -lnr 1 | uniq | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
}
zle -N history_search
bindkey '^r' history_search
