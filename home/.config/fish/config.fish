set fish_greeting

alias history "history --show-time='%Y-%m-%d %T '"
alias ls='ls --color=auto'
alias ll='ls -alh'
alias lt='ls -alht'
alias cp='cp -i'
alias mv='mv -i'
alias vim='nvim'
alias cal3='cal -C3'
alias fd='fdfind --hidden'
alias rg='rg --hidden --ignore --glob "!**/.git/**"'
alias diff='colordiff'
alias cdg="cd (git rev-parse --show-toplevel)"

alias sl-command='command sl'
alias sl='ls'

# path; prevent double add to path
if not echo $PATH | grep /opt >/dev/null
  set PATH \
    /opt/bin \
    /opt/anyenv/envs/rbenv/shims \
    /opt/anyenv/envs/nodenv/shims \
    $HOME/dotfiles/shell_commands \
    $PATH
end

# direnv hook fish
function __direnv_export_eval --on-event fish_prompt;
  eval (direnv export fish);
end

test -n "$REMOTE_CONTAINERS" && exit # return if in devcontainer -----

# anyenv variables
set -x ANYENV_ROOT /opt/anyenv
set -x RBENV_ROOT /opt/anyenv/envs/rbenv
set -x NODENV_ROOT /opt/anyenv/envs/nodenv
set -x RBENV_SHELL fish
set -x NODENV_SHELL fish

set -x EDITOR nano

# clean $HOME
set -x npm_config_cache ~/.cache/npm
set -x CDK_HOME ~/.cache/cdk
set -x BUNDLE_USER_HOME ~/.cache/bundle
set -x HISTFILE ~/.cache/history
set -x NODE_REPL_HISTORY ~/.cache/node_repl_history
set -x SQLITE_HISTORY ~/.cache/sqlite_history
set -x MYSQL_HISTFILE ~/.cache/mysql_history
set -x LESSHISTFILE - # disable .lesshst
set -x ANSIBLE_RETRY_FILES_ENABLED false

test -f ~/.config/fish/secret_env && source ~/.config/fish/secret_env
