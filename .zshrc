autoload -U colors && colors

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
compinit
promptinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Tab補完時に大文字/小文字無視

# word chars
export WORDCHARS=$(echo $WORDCHARS | sed "s/\///")
export WORDCHARS=$(echo $WORDCHARS | sed "s/\.//")
export WORDCHARS=$(echo $WORDCHARS | sed "s/_//")

# history
autoload -U history-search-end
export HISTFILE=$HOME/.config/zsh/.zsh_history
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

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':chpwd:*' recent-dirs-file $HOME/.config/zsh/.chpwd-recent-dirs
zstyle ':completion:*' recent-dirs-insert both

# peco cdr
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^o' peco-cdr

# peco command history
function peco-select-history() {
    local tac=$(which tac && echo "tac" || echo "tail -r")
    BUFFER=$(\history -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# ssh bgcolor
function set_term_bgcolor() {
  local R=${1}*65535/255
  local G=${2}*65535/255
  local B=${3}*65535/255

  /usr/bin/osascript <<EOF
  tell application "iTerm2"
    tell current session of current window
      set background color to {$R, $G, $B}
    end tell
  end tell
EOF
}

function _colored_ssh() {
    local host=""
    for i in $(seq $# -1 1)
    do
        if echo $@[$i] | grep -v "^-" > /dev/null; then
            host=$@[$i]
            break
        fi
    done

    local label=$(grep "^Host ${host} " $HOME/.ssh/config | sed "s/[^#]*# *//g")
    test -z $label && echo $host | grep "192\.168\.*" > /dev/null && label="local"

    case $label in
    "production")
        set_term_bgcolor 64 0 0
        ;;
    "testing" | "internal")
        set_term_bgcolor 32 0 48
        ;;
    "local")
        set_term_bgcolor 0 0 0
        ;;
    *)
        set_term_bgcolor 32 32 0
        ;;
    esac

    \ssh $@
    set_term_bgcolor 0 0 0
}
alias ssh='_colored_ssh'

# export
export LC_CTYPE=ja_JP.UTF-8
export EDITOR=vim
export SVN_EDITOR='emacsclient -t -a ""'
export VTE_CJK_WIDTH=auto
export TERM=xterm-256color
export GOPATH="$HOME/.config/go"
export GOBIN="$GOPATH/bin"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOBIN"
export PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export XDG_CONFIG_HOME=$HOME/.config

# *env
if which pyenv > /dev/null; then
    export PYENV_ROOT=/usr/local/var/pyenv
    # 以下、"pyenv init - --no-rehash"の出力と同一
    # 直書きのが実行が早い
    export PATH="/usr/local/var/pyenv/shims:${PATH}"
    export PYENV_SHELL=zsh
    source '/usr/local/Cellar/pyenv/1.0.10/libexec/../completions/pyenv.zsh'
    pyenv() {
      local command
      command="$1"
      if [ "$#" -gt 0 ]; then
        shift
      fi

      case "$command" in
      rehash|shell)
        eval "$(pyenv "sh-$command" "$@")";;
      *)
        command pyenv "$command" "$@";;
      esac
    }
fi
if which rbenv > /dev/null; then
    export RBENV_ROOT=/usr/local/var/rbenv
    # pyenvと同様
    export PATH="/usr/local/var/rbenv/shims:${PATH}"
    export RBENV_SHELL=zsh
    source '/usr/local/Cellar/rbenv/1.1.0/libexec/../completions/rbenv.zsh'
    rbenv() {
      local command
      command="$1"
      if [ "$#" -gt 0 ]; then
        shift
      fi

      case "$command" in
      rehash|shell)
        eval "$(rbenv "sh-$command" "$@")";;
      *)
        command rbenv "$command" "$@";;
      esac
    }
fi

# alias
alias ls='ls --color=auto'
alias ll='ls -alh'
alias lt='ls -alht'
alias cp='cp -i'
alias mv='mv -i'
alias sjis='iconv -f cp932'
alias emacs='emacsclient -t -a ""'
alias cd..='cd ..'
alias git='hub'
which colordiff > /dev/null && alias diff='colordiff -u'
alias cdgit='cd $(git rev-parse --show-toplevel)'


source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


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
