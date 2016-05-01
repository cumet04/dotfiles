autoload -U compinit promptinit
autoload -U colors && colors
autoload -U history-search-end
compinit
promptinit

# This will set the default prompt to the walters theme
prompt walters

# prompt
function _set_prompt_color() {
    local COLOR_FG="%{[38;5;001m%}"
    local COLOR_BG="%{[48;5;235m%}"
    local COLOR_END="%{[0m%}"
    PROMPT="${COLOR_BG}%c ${COLOR_END}>"
}
PROMPT="%U%F{cyan}%c >%u %f"
RPROMPT='%F{green}%~%f'
setopt prompt_subst


# word chars
export WORDCHARS=$(echo $WORDCHARS | sed "s/\///")
export WORDCHARS=$(echo $WORDCHARS | sed "s/_//")

# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000
setopt extended_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_space

# key bindings
bindkey -e  # readline相当の部分をemacsバインドに
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^]'   vi-find-next-char
bindkey '^[^]' vi-find-prev-char

# git root
function cdgit() {
    cd $(git rev-parse --show-toplevel)
}

# peco incremental-search
function peco-select-history() {
    local tac=$(which tac && echo "tac" || echo "tail -r")
    BUFFER=$(\history -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    # zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# export
export EDITOR=nvim
export VTE_CJK_WIDTH=auto
export TERM=xterm-256color
export GOPATH="$HOME/.config/go:$HOME/Documents"
export PATH="$PATH:$GOPATH/bin"
export XDG_CONFIG_HOME=$HOME/.config

case ${OSTYPE} in
darwin*)
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    export GOROOT="/usr/local/opt/go/libexec"

    export PYENV_ROOT=/usr/local/var/pyenv
    if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
    ;;
linux*)
    export GOROOT="/usr/lib/go/"
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS="@im=fcitx"
    if [ -e "$HOME/.config/pyenv" ]; then
        export PYENV_ROOT="$HOME/.config/pyenv"
        export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
        if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
    fi
    ;;
esac


# alias
alias ls='ls --color=auto'
alias ll='ls -alh'
alias cp='cp -i'
alias mv='mv -i'
alias tmux='tmux;fc -R'
alias vim='nvim'
test -e $HOME/.alias_local && source $HOME/.alias_local


if [ -e "$HOME/.config/google-cloud-sdk" ]; then
    source $HOME'/.config/google-cloud-sdk/path.zsh.inc'
    source $HOME'/.config/google-cloud-sdk/completion.zsh.inc'
fi

# load syntax-highlighting
# エラーを潰していて本当は良くない（if [ -e ... ]したほうがいい）が...
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null

