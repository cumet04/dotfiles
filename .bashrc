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
    export GOROOT="/usr/lib/go/"
fi

if [ "$(uname)" == 'Darwin' ]; then
	PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    # alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
    export GOROOT="/usr/local/go/"
fi

if [ -e "$HOME/.config/pyenv" ]; then
    export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
    if [[ ! $PYENV_ROOT ]]; then
        export PYENV_ROOT="$HOME/.config/pyenv"
        eval "$(pyenv init -)"
    fi
fi
source $HOME'/.config/google-cloud-sdk/path.bash.inc'
source $HOME'/.config/google-cloud-sdk/completion.bash.inc'

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

export GOPATH="$HOME/.config/go:$HOME/Documents"
export PATH="$PATH:$GOPATH/bin"
export XDG_CONFIG_HOME=$HOME/.config

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

source $HOME'/.alias_local'
