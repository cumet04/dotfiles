# *envなどでよくある"eval $(some command...)"は.zshrcに直接書くより
# コマンドの実行結果を直接.zshrcに展開したほうが実行が速い

# pyenv; eval $(pyenv init - -no-rehash)
if which pyenv > /dev/null; then
    export PYENV_ROOT=/usr/local/var/pyenv
    export PATH="/usr/local/var/pyenv/shims:${PATH}"
    export PYENV_SHELL=zsh
    source '/usr/local/Cellar/pyenv/1.0.10/libexec/../completions/pyenv.zsh'
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
fi

# rbenv; eval $(rbenv init - -no-rehash)
if which rbenv > /dev/null; then
    export RBENV_ROOT=/usr/local/var/rbenv
    # pyenvと同様
    export PATH="/usr/local/var/rbenv/shims:${PATH}"
    export RBENV_SHELL=zsh
    source '/usr/local/Cellar/rbenv/1.1.0/libexec/../completions/rbenv.zsh'
    rbenv() {
      local command
      command="$1"
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
fi

# direnv; eval $(direnv hook zsh)
_direnv_hook() {
  eval "$(direnv export zsh)";
}
typeset -ag precmd_functions;
if [[ -z ${precmd_functions[(r)_direnv_hook]} ]]; then
  precmd_functions+=_direnv_hook;
fi
