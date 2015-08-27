#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias ls='ls --color=auto'
PS1='\[\e[1;37m\][\u@\h \W]\$\[\e[0m\] '
# PS1='[\u@\h \W]\$ '

alias vi=vimx
alias vim=vimx
alias emacs="emacs -nw"
export EDITOR=emacs
export TERM=xterm-256color
# export DOCKER_HOST="tcp://192.168.100.122:2375"
