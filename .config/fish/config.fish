set fish_greeting
set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -gx PATH /opt/bin/anyenv/bin $PATH

alias history "history --show-time='%Y-%m-%d %T '"
alias ls='ls --color=auto'
alias ll='ls -alh'
alias lt='ls -alht'
alias cp='cp -i'
alias mv='mv -i'
alias vim='nvim'
alias ssh='colored_ssh'
alias tmux='tmux -f ~/.config/tmux.conf'

set -U GHQ_SELECTOR peco

set -gx ANYENV_ROOT /opt/bin/anyenv/
source (anyenv init - --no-rehash fish | psub)

bind \cr 'commandline (history | peco --layout=bottom-up | sed "s/^[^ ]* [^ ]* //")'
