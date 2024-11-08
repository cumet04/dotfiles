function set_prompt() {
  if [[ $? -eq 0 ]] then
    local status_color=green
  else
    local status_color=red
  fi
  local name=$(pwd | tr -d "\n" | sed "s|$HOME|\$HOME|" | xargs basename)
  PROMPT="%U%F{green}$name%f%u%F{$status_color}> %f"
}
precmd_functions+=(set_prompt)

function keep_current_path() {
  # refs https://learn.microsoft.com/ja-jp/windows/terminal/tutorials/new-tab-same-directory
  printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"
}
precmd_functions+=(keep_current_path)
