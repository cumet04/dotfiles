set fish_greeting

alias history "history --show-time='%Y-%m-%d %T '"
alias ls='ls --color=auto'
alias ll='ls -alh'
alias lt='ls -alht'
alias cp='cp -i'
alias mv='mv -i'
alias vim='nvim'
alias cal3='cal -C3'
alias pt='pt --hidden'
alias diff='colordiff'
alias cdg="cd (git rev-parse --show-toplevel)"
alias ssh='colored_ssh'
alias tmux='tmux -f ~/.config/tmux.conf'

# path; prevent double add to path
echo $PATH | grep /opt > /dev/null; or set PATH \
  /opt/bin \
  /opt/bin/shell_commands \
  /opt/cargo/bin \
  /opt/anyenv/envs/rbenv/shims \
  /opt/anyenv/envs/nodenv/shims \
  ~/.local/bin \
  $PATH

# anyenv variables
set -x ANYENV_ROOT /opt/anyenv
set -x RBENV_ROOT /opt/anyenv/envs/rbenv
set -x NODENV_ROOT /opt/anyenv/envs/nodenv
set -x RBENV_SHELL fish
set -x NODENV_SHELL fish

set -x EDITOR nano
set -x GOBIN /opt/bin
set -x GO111MODULE on
set -x CARGO_HOME /opt/cargo
set -x RUSTUP_HOME /opt/rustup

# clean $HOME
set -x GOPATH ~/.cache/go
set -x LESSHISTFILE - # disable .lesshst
set -x NODE_REPL_HISTORY ~/.cache/node_repl_history
set -x npm_config_cache ~/.cache/npm
set -x ANSIBLE_RETRY_FILES_ENABLED false

# ---

test -f ~/.config/fish/secret_env && source ~/.config/fish/secret_env

# direnv hook fish
function __direnv_export_eval --on-event fish_prompt;
	eval (direnv export fish);
end

test -z "$TMUX"; and test -z "$VSCODE_IPC_HOOK_CLI"; and tmux
