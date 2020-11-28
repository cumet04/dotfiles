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
alias diff='colordiff'
alias cdg="cd (git rev-parse --show-toplevel)"
alias ssh='colored_ssh'
alias tmux='tmux -f ~/.config/tmux.conf'
alias gitco="git branch | grep -v '*' | cho | xargs git checkout"

alias sl-command='command sl'
alias sl='ls'

# path; prevent double add to path
echo $PATH | grep /opt > /dev/null; or set PATH \
  /opt/bin \
  /opt/bin/go \
  /opt/bin/shell_commands \
  /opt/cargo/bin \
  /opt/anyenv/envs/rbenv/shims \
  /opt/anyenv/envs/nodenv/shims \
  $HOME/.local/bin \
  $PATH

# anyenv variables
set -x ANYENV_ROOT /opt/anyenv
set -x RBENV_ROOT /opt/anyenv/envs/rbenv
set -x NODENV_ROOT /opt/anyenv/envs/nodenv
set -x RBENV_SHELL fish
set -x NODENV_SHELL fish

set -x EDITOR nano
set -x GOBIN /opt/bin/go
set -x GO111MODULE on
set -x CARGO_HOME /opt/cargo
set -x RUSTUP_HOME /opt/rustup

# clean $HOME
set -x GOPATH ~/.cache/go
set -x npm_config_cache ~/.cache/npm
set -x CDK_HOME ~/.cache/cdk
set -x HISTFILE ~/.cache/history
set -x NODE_REPL_HISTORY ~/.cache/node_repl_history
set -x SQLITE_HISTORY ~/.cache/sqlite_history
set -x MYSQL_HISTFILE ~/.cache/mysql_history
set -x LESSHISTFILE - # disable .lesshst
set -x ANSIBLE_RETRY_FILES_ENABLED false

# WSL2 hack; add windows ip to hosts
if not grep windows.localdomain /etc/hosts > /dev/null
  echo 'Clean /tmp'
  find /tmp/ -mindepth 1 | xargs rm -rf ^/dev/null
  echo 'Clean $HOME'
  clean_home
  echo 'Add windows ip to hosts:'
  set winip (ip route show to default | cut -d' ' -f 3)
  echo "$winip windows.localdomain" | sudo tee -a /etc/hosts
end

# ---

test -f ~/.config/fish/secret_env && source ~/.config/fish/secret_env

# direnv hook fish
function __direnv_export_eval --on-event fish_prompt;
	eval (direnv export fish);
end

test -z "$TMUX"; and test -z "$VSCODE_IPC_HOOK_CLI"; and tmux
