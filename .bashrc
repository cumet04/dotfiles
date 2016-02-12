#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function _update_ps1() {
    PS1="$(~/.config/powerline-shell.py --cwd-mode dironly $? 2> /dev/null)"
    history -a  # .bash_historyに前回コマンドを1行追記
}
if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
    shopt -u histappend
fi

if [ "$(uname)" == 'Darwin' ]; then
	PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    # alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
fi

alias ls='ls --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias tmux='tmux;history -r'
alias vim='nvim'

export HISTSIZE=10000
export HISTFILESIZE=20000
export EDITOR=nvim
export VTE_CJK_WIDTH=auto
export TERM=xterm-256color

export GOPATH=$HOME/.go
export PATH="$PATH:$GOPATH/bin"
export XDG_CONFIG_HOME=$HOME/.config

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

