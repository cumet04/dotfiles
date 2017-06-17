
function peco_cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}

function peco_select_history() {
    local tac=$(which tac && echo "tac" || echo "tail -r")
    BUFFER=$(\history -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
}

function sshgrep() {
    local nums=$(grep -n "Host .*$1" $HOME/.ssh/config | cut -d":" -f 1)
    {
    for num in $(echo $nums);do
        local last=$(($num + 10))
        for n in $(seq $num $last);do
            # output line $n, and if the line is empty then break loop
            sed -n "${n}p" $HOME/.ssh/config | grep "..*" >&1 || break
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
function _colored_ssh() {
    _values '' $(grep "^Host " $HOME/.ssh/config | cut -d" " -f 2)
}
 compdef _colored_ssh colored_ssh
