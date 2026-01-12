function set_prompt() {
  if [[ $? -eq 0 ]] then
    local status_color=green
  else
    local status_color=red
  fi
  local name=$(pwd | tr -d "\n" | sed "s|$HOME|\$HOME|" | sed "s|\(.*\)|'\1'|" | xargs basename)
  PROMPT="%U%F{green}$name%f%u%F{$status_color}> %f"
}
precmd_functions+=(set_prompt)

function keep_current_path() {
  # refs https://learn.microsoft.com/ja-jp/windows/terminal/tutorials/new-tab-same-directory
  local path=$(command -v wslpath >/dev/null && wslpath -w "$PWD" || echo "$PWD")
  printf "\e]9;9;%s\e\\" "$path"
}
precmd_functions+=(keep_current_path)
