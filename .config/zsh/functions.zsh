
# ==============================================================================
# cdls
# ==============================================================================
function cdls() {
    \cd $1 && ls --color=auto
}

# ==============================================================================
# vim-history
# ==============================================================================
function __vim_append() {
    if [ -e "$@" ]; then
        local path="$@"
        if [[ ! $path =~ ^/ ]]; then
            path=${PWD}/${path}
        fi
        echo $path >> ${ZSH_HOME}/.vim_history
    fi
    vim $@
}
function vime() {
    local selected=$(cat ${ZSH_HOME}/.vim_history | peco)
    test -z "$selected" && exit 0
    vim "$selected"
}


# ==============================================================================
# peco
# ==============================================================================
function peco_cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}

function peco_select_history() {
    BUFFER=$(\history -n 1 | tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
}

# https://qiita.com/itkrt2y/items/0671d1f48e66f21241e2#%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E3%83%AA%E3%83%9D%E3%82%B8%E3%83%88%E3%83%AA%E3%81%B8%E3%81%AE%E7%A7%BB%E5%8B%95--cd-ghq-rootghq-list--peco
function peco_ghq_look () {
    local selected=$(ghq list | peco)
    if [ -n "$selected" ]; then
        cd $(ghq root)/$selected
        zle accept-line
    fi
}

function peco_ghq_browse () {
    local selected=$(ghq list | peco)
    if [ -n "$selected" ]; then
        open "https://$selected"
    fi
}

# ==============================================================================
# ssh
# ==============================================================================
function sshgrep() {
    local nums=$(grep -n "Host .*$1" $HOME/.ssh/config | cut -d":" -f 1)
    {
    for num in $(echo $nums);do
        echo -n "$num: "
        local last=$(($num + 10))
        for n in $(seq $num $last);do
            # output line $n, and if the line is empty then break loop
            sed -n "${n}p" $HOME/.ssh/config | grep "..*" >&1 || {echo "" ; break}
        done
    done
    # buffering stdout
    } | dd 2>/dev/null
}

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

function colored_ssh() {
    local host=""
    for i in $(seq $# -1 1)
    do
        if echo $@[$i] | grep -v "^-" > /dev/null; then
            host=$@[$i]
            break
        fi
    done

    local label=$(grep "^Host \(\S* \)*${host} " $HOME/.ssh/config | sed "s/[^#]*# *//g")
    test -z $label && echo $host | grep "192\.168\.*" > /dev/null && label="local"

    case $label in
    "production")
        set_term_bgcolor 64 0 0
        ;;
    "internal" | "preopen")
        set_term_bgcolor 32 0 48
        ;;
    "testing")
        set_term_bgcolor 32 32 0
        ;;
    "local")
        set_term_bgcolor 0 0 0
        ;;
    *)
        set_term_bgcolor 80 80 64
        ;;
    esac

    \ssh $@
    set_term_bgcolor 0 0 0
}
# function _colored_ssh() {
#     _values '' $(grep "^Host " $HOME/.ssh/config | cut -d" " -f 2)
# }
# compdef _colored_ssh colored_ssh


# ==============================================================================
# password
# ==============================================================================
function __password_filename() {
    echo "$HOME/workdir/.shared/pass.$(hostname | cut -d"." -f1).encrypted"
}
function pass() {
    local passfile=$(__password_filename)
    local raw=$(openssl aes-256-cbc -d -in "$passfile" -pass file:"$HOME/.ssh/id_rsa")
    local selected=$(echo "$raw" | grep -v "^#" | sed "s/://" | column -t -s " " | peco --query "$1")
    test -z $selected && echo "No line selected" && return 0;

    echo $selected | cut -d" " -f1

    local body=$(echo $selected | sed "s/^[^ ]* *//")
    echo $body | grep " " | cut -d" " -f1
    local pass=$(echo $body | rev | cut -d" " -f1 | rev) # revcutは遅いのでもうちょいなんとか
    echo -n $pass | tee >(pbcopy)
}
function passedit() {
    local passfile=$(__password_filename)
    local tmpfile=$(mktemp)
    trap 'rm -f $tmpfile' 0 SIGHUP SIGINT SIGTERM

    openssl aes-256-cbc -d -in "$passfile" -out $tmpfile -pass file:"$HOME/.ssh/id_rsa"
    nvim $tmpfile
    openssl aes-256-cbc -e -in $tmpfile -out "$passfile" -pass file:"$HOME/.ssh/id_rsa"

    rm -f $tmpfile
}


# ==============================================================================
# mac-tmpfs
# ==============================================================================
function mktmpfs() {
# hdiutilの出力がそのまま$mydevになるが、hdiutilの行とnewfs_hfsを分けると何故か失敗する
    local giga=2
    local out=$(newfs_hfs $(hdiutil attach -nomount ram://$(($giga * 1024 * 1024 * 2))))
    local mydev=$(echo $out | cut -d' ' -f 2 | tr -d 'r')
    sudo mkdir /Volumes/tmpfs 2>/dev/null
    sudo mount -t hfs "$mydev" /Volumes/tmpfs
}

# ==============================================================================
# git
# ==============================================================================
function oroget() {
    ghq get -p oRojp/$@
}

# ==============================================================================
# *env
# ==============================================================================
function rbenv() {
    unset -f rbenv
    export RBENV_ROOT="/opt/rbenv"
    eval "$(rbenv init - --no-rehash)"
    rbenv "$@"
}
function nodenv() {
    unset -f nodenv
    export NODENV_ROOT="/opt/nodenv"
    eval "$(nodenv init - --no-rehash)"
    nodenv "$@"
}
function pyenv() {
    unset -f pyenv
    export PYENV_ROOT="/opt/pyenv"
    eval "$(pyenv init - --no-rehash)"
    pyenv "$@"
}
