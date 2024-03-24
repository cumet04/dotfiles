set fish_greeting

alias history="history --show-time='%Y-%m-%d %T '"
alias ls='ls --color=auto'
alias ll='ls -alh'
alias lt='ls -alht'
alias cp='cp -i'
alias mv='mv -i'
alias vim='nvim'
alias cal3='cal -C3'
alias fd='fdfind --hidden'
alias rg='rg --hidden --ignore --glob "!**/.git/**"'
alias diff='colordiff'
alias cdg="cd (git rev-parse --show-toplevel)"

alias sl-command='command sl'
alias sl='ls'

# builtin cd を使うと移動履歴が消えるのでaliasで退避する refs https://github.com/fish-shell/fish-shell/issues/4869
# またfunctions/ディレクトリに置くと`functions -c cd`時点でそのファイルが旧cdになってしまうため、config.fishに定義する
functions -c cd builtin_cd
function cd
  builtin_cd $argv; and ls
end

# direnv hook fish
function __direnv_export_eval --on-event fish_prompt;
  eval (direnv export fish);
end

test -n "$REMOTE_CONTAINERS" && exit # return if in devcontainer -----

test -f ~/.config/fish/secret_env && source ~/.config/fish/secret_env
test "$TERM_PROGRAM" != "vscode" && test -f /tmp/.fish-last-dir && builtin cd (cat /tmp/.fish-last-dir)
