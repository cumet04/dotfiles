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
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    export GOROOT="/usr/local/opt/go/libexec"

    export PYENV_ROOT=/usr/local/var/pyenv
    if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
else
    export GOROOT="/usr/lib/go/"
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS="@im=fcitx"
    if [ -e "$HOME/.config/pyenv" ]; then
        export PYENV_ROOT="$HOME/.config/pyenv"
        export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
        if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
    fi
fi

if [ -e "$HOME/.config/google-cloud-sdk" ]; then
    source $HOME'/.config/google-cloud-sdk/path.bash.inc'
    source $HOME'/.config/google-cloud-sdk/completion.bash.inc'
fi

#pecoの設定
export HISTCONTROL="ignoredups"
function _peco-history() {
    local NUM=$(history | wc -l)
    local FIRST=$((-1*(NUM-1)))

    if [ $FIRST -eq 0 ] ; then
        history -d $((HISTCMD-1))
        echo "No history" >&2
        return
    fi

    local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

    if [ -n "$CMD" ] ; then
        history -s $CMD

        if type osascript > /dev/null 2>&1 ; then
            (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
        fi
    else
        history -d $((HISTCMD-1))
    fi
}
bind -x '"\C-r":_peco-history'

# git root
function cdgit() {
    cd $(git rev-parse --show-toplevel)
}


alias ls='ls --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias tmux='tmux;history -r'
alias vim='nvim'

HISTTIMEFORMAT='%Y%m%d-%T ';
export HISTTIMEFORMAT
export HISTSIZE=10000
export HISTFILESIZE=20000
export EDITOR=nvim
export VTE_CJK_WIDTH=auto
export TERM=xterm-256color

export GOPATH="$HOME/.config/go:$HOME/Documents"
export PATH="$PATH:$GOPATH/bin"
export XDG_CONFIG_HOME=$HOME/.config

source $HOME'/.alias_local'
