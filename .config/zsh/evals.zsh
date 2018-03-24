# *envなどでよくある"eval $(some command...)"は.zshrcに直接書くより
# コマンドの実行結果を直接.zshrcに展開したほうが実行が速い

export RBENV_ROOT="/opt/rbenv"
# rbenv; eval $(rbenv init - --no-rehash)
export PATH="/opt/rbenv/shims:${PATH}"
export RBENV_SHELL=zsh
source '/opt/rbenv/libexec/../completions/rbenv.zsh'
rbenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}


export NODENV_ROOT="/opt/nodenv"
# nodenv; eval $(nodenv init - -no-rehash)
export PATH="/opt/nodenv/shims:${PATH}"
export NODENV_SHELL=zsh
source '/opt/nodenv/libexec/../completions/nodenv.zsh'
nodenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(nodenv "sh-$command" "$@")";;
  *)
    command nodenv "$command" "$@";;
  esac
}

export PYENV_ROOT="/opt/pyenv"
# pyenv; eval $(pyenv init - --no-rehash)
export PATH="/opt/pyenv/shims:${PATH}"
export PYENV_SHELL=zsh
source '/opt/pyenv/libexec/../completions/pyenv.zsh'
pyenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")";;
  *)
    command pyenv "$command" "$@";;
  esac
}

# export EXENV_ROOT="/opt/exenv"
# # exenv; eval $(exenv init - -no-rehash)
# export PATH="/opt/exenv/shims:${PATH}"
# source "/opt/exenv/libexec/../completions/exenv.zsh"
# exenv() {
#   local command="$1"
#   if [ "$#" -gt 0 ]; then
#     shift
#   fi
# 
#   case "$command" in
#   shell)
#     eval `exenv "sh-$command" "$@"`;;
#   *)
#     command exenv "$command" "$@";;
#   esac
# }

# direnv; eval $(direnv hook zsh)
# _direnv_hook() {
#   eval "$(direnv export zsh)";
# }
# typeset -ag precmd_functions;
# if [[ -z ${precmd_functions[(r)_direnv_hook]} ]]; then
#   precmd_functions+=_direnv_hook;
# fi
