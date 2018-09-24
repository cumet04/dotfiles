function peco_select_history() {
    BUFFER=$(\history -n 1 | tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
}
