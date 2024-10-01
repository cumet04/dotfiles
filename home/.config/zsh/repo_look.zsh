function repo_look() {
  local root=$HOME/repos
  local selected=$(
    find $root -maxdepth 3 -mindepth 3 -type d,l |
    sed "s|$root/||g" |
    sed "s|github\.com/||g" |
    sort |
    peco
  )
  [[ -z $selected ]] && return

  local target=$root/github.com/$selected
  if [[ -d $target ]] then
    cd $target
    git s
  fi
  zle accept-line
}
zle -N repo_look
bindkey '^g' repo_look
