function colored_ssh

    set host $argv[(count $argv)]

    set label (grep "^Host \(\S* \)*$host " $HOME/.ssh/config | sed "s/[^#]*# *//g")
    test -z $label; and echo $host | grep "192\.168\.*" > /dev/null; and set label "local"

    switch "$label"
        case "production"
            set_term_bgcolor 64 0 0
        case "internal" "preopen"
            set_term_bgcolor 32 0 48
        case "testing"
            set_term_bgcolor 32 32 0
        case "local"
            set_term_bgcolor 0 0 0
        case *
            set_term_bgcolor 80 80 64
    end

    command ssh $argv
    set_term_bgcolor 0 0 0
end
