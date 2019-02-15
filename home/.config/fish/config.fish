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

set -Ux GOPATH /opt/var/go
set -Ux EDITOR nano

# TODO: たぶんmac側でやったほうがいい
set -Ux LANG en_US.UTF-8
set -Ux LC_ALL en_US.UTF-8

test -z "$TMUX"; and tmux
