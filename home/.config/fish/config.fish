set fish_greeting

alias history "history --show-time='%Y-%m-%d %T '"
alias ls='ls --color=auto'
alias ll='ls -alh'
alias lt='ls -alht'
alias cp='cp -i'
alias mv='mv -i'
alias vim='nvim'
alias cdg="cd (git rev-parse --show-toplevel)"
alias ssh='colored_ssh'
alias tmux='tmux -f ~/.config/tmux.conf'

set -U GHQ_SELECTOR peco
set -Ux GOPATH /opt/var/go

test -z "$TMUX"; and tmux
