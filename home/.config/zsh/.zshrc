autoload -Uz compinit; compinit

# デフォルトではctrl-wで単語区切りも何もなくほぼ全部消えてしまうのを修正
autoload -Uz select-word-style
select-word-style bash

# shell操作(補完でtab連打したときなど)にbellが鳴るのを抑制。echo -e "\a" は鳴る
unsetopt BEEP

export HISTFILE=$ZDOTDIR/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt extended_history
setopt share_history

alias ls='ls --color=auto'
alias ll='ls -alh'
alias cp='cp -i'
alias mv='mv -i'
alias fd='fdfind --hidden'
alias rg='rg --hidden --ignore --glob "!**/.git/**"'
alias cdg='cd $(git rev-parse --show-toplevel)'
alias pete='print -z $(pet search)' # pet exec相当だが、実行コマンドをhistoryに残せるようにshell経由実行にするラッパー
alias vim='nvim'
alias diff='colordiff'

eval "$(direnv hook zsh)"

source $ZDOTDIR/tig_status.zsh
source $ZDOTDIR/history_search.zsh
source $ZDOTDIR/repo_look.zsh
source $ZDOTDIR/prompt.zsh

source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
