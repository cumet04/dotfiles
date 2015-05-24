#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias vi=vim
alias emacs="emacs -nw"
export TERM=xterm-256color
export DOCKER_HOST="tcp://192.168.100.122:2375"
