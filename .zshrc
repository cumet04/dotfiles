#zmodload zsh/zprof && zprof

autoload -U colors && colors
export XDG_CONFIG_HOME=$HOME/.config
ZSH_HOME=$XDG_CONFIG_HOME/zsh

## vcs-prompt
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "[%F{green}%u%c%b%f]"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_} '$RPROMPT

# prompt
function _set_prompt_color() {
    local COLOR_FG="%{[38;5;001m%}"
    local COLOR_BG="%{[48;5;235m%}"
    local COLOR_END="%{[0m%}"
    PROMPT="${COLOR_BG}%c ${COLOR_END}>"
}
PROMPT="%U%F{cyan}%c%u%f"'${vcs_info_msg_0_}'" > "
RPROMPT='%F{green}%~%f'
setopt prompt_subst

# completion
autoload -U compinit promptinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Tab補完時に大文字/小文字無視
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

# load custom functions
source $ZSH_HOME/functions.zsh

# word chars
export WORDCHARS=$(echo $WORDCHARS | sed "s/\///")
export WORDCHARS=$(echo $WORDCHARS | sed "s/\.//")
export WORDCHARS=$(echo $WORDCHARS | sed "s/_//")

# history
autoload -U history-search-end
export HISTFILE=$ZSH_HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=100000
setopt extended_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups

# key bindings
bindkey -e  # readline相当の部分をemacsバインドに
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^]'   vi-find-next-char
bindkey '^[^]' vi-find-prev-char

### cdlsが遅くなるので一旦無効化
# cdr
# autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
# add-zsh-hook chpwd chpwd_recent_dirs
# zstyle ':chpwd:*' recent-dirs-max 5000
# zstyle ':chpwd:*' recent-dirs-default yes
# zstyle ':chpwd:*' recent-dirs-file $ZSH_HOME/.chpwd-recent-dirs
# zstyle ':completion:*' recent-dirs-insert both

# peco cdr
# zle -N peco_cdr
# bindkey '^o' peco_cdr

# peco command history
zle -N peco_select_history
bindkey '^r' peco_select_history

# peco command history
zle -N peco_ghq_look
bindkey '^g' peco_ghq_look

# export
export LC_CTYPE=ja_JP.UTF-8
export EDITOR=emacs
export SVN_EDITOR=emacs
export VTE_CJK_WIDTH=auto
export TERM=xterm-256color
export GOPATH="/opt/var/go:/opt/var/ghq"
export GOBIN="/opt/var/go/bin"
export GOPATH="/opt/var/go"
export VAGRANT_HOME="/opt/var/vagrant.d"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PATH="$PATH:$GOBIN"
export PATH="/opt/bin:$PATH"
export PATH="/usr/local/opt/python@2/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# alias
alias cd=cdls
alias ls='ls --color=auto'
alias ll='ls -alh'
alias lt='ls -alht'
alias cp='cp -i'
alias mv='mv -i'
alias vim='nvim'
alias ssh='colored_ssh'
alias sjis='iconv -f cp932'
alias cd..='cd ..'
alias git='hub'
alias mn='memo new'
alias me='memo le'
alias mg='memo grep'
alias mt='memo tmp'
alias mc='memo cat'
alias agr='ag -G "\.rb" --ignore-dir "db" --ignore-dir "spec"'
alias mente='memo maintenance'
alias github='peco_ghq_browse'
which colordiff > /dev/null && alias diff='colordiff -u'
alias cdg='cd "$(git rev-parse --show-toplevel)"'
alias url_decode="python -c 'import sys;sys.stdout.write(sys.stdin.read())'"

eval "$(direnv hook zsh)"

source /opt/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh


# alert not-sync dotfiles repo
# 遅いので保留
# function check-dotfiles() {
#     local _pwd=$PWD
#     cd $HOME/etc/dotfiles
#     git status --short
#     git log @{u}..HEAD --oneline
#     cd $_pwd
# }
# check-dotfiles
# unset -f check-dotfiles

if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
