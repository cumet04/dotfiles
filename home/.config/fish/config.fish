set fish_greeting

### [wsl hack]
umask 022
# clean windows PATHs
set -x PATH /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

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

set -x PATH /opt/bin $PATH
set -x PATH /opt/bin/shell_commands $PATH
set -x PATH /opt/var/go/bin $PATH

set -x EDITOR nano
set -x GOPATH ~/.cache/go
set -x GOBIN /opt/bin
set -x GO111MODULE on
set -x ANSIBLE_RETRY_FILES_ENABLED false
set -x LESSHISTFILE - # disable .lesshst
set -x npm_config_cache ~/.cache/npm

source ~/.config/fish/secret_env

# direnv hook fish
function __direnv_export_eval --on-event fish_prompt;
	eval (direnv export fish);
end

test -z "$TMUX"; and tmux
