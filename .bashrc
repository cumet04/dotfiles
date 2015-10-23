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
    share_history
}
function share_history {  # 以下の内容を関数として定義
    history -a  # .bash_historyに前回コマンドを1行追記
}
if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
    shopt -u histappend
fi

if [ "$(uname)" == 'Darwin' ]; then
	PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    # alias emacs="/Applications/7.\ Emacs.app/Contents/MacOS/Emacs -nw"
fi

alias ls='ls --color=auto'

if which vimx &> /dev/null; then
   alias vi=vimx
   alias vim=vimx
fi
alias lock="xscreensaver-command -lock"
export EDITOR=emacs
export TERM=xterm-256color
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
# export DOCKER_HOST="tcp://192.168.100.122:2375"
