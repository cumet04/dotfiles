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

# path
set PATH ~/.local/bin $PATH
set PATH /opt/bin $PATH
set PATH /opt/bin/shell_commands $PATH
set PATH /opt/cargo/bin $PATH

# anyenv variables
set ANYENV_ROOT /opt/anyenv
set RBENV_ROOT /opt/anyenv/envs/rbenv
set NODENV_ROOT /opt/anyenv/envs/nodenv
set PATH '/opt/anyenv/envs/rbenv/shims' $PATH
set PATH '/opt/anyenv/envs/nodenv/shims' $PATH
set RBENV_SHELL fish
set NODENV_SHELL fish

set EDITOR nano
set GOBIN /opt/bin
set GO111MODULE on
set CARGO_HOME /opt/cargo
set RUSTUP_HOME /opt/rustup

# clean $HOME
set GOPATH ~/.cache/go
set LESSHISTFILE - # disable .lesshst
set NODE_REPL_HISTORY ~/.cache/node_repl_history
set npm_config_cache ~/.cache/npm
set ANSIBLE_RETRY_FILES_ENABLED false

# ---

test -f ~/.config/fish/secret_env && source ~/.config/fish/secret_env

# direnv hook fish
function __direnv_export_eval --on-event fish_prompt;
	eval (direnv export fish);
end

test -z "$TMUX"; and test -z "$VSCODE_IPC_HOOK_CLI"; and tmux
