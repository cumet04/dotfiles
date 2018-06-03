function set_term_bgcolor
    tmux select-pane -P (printf "bg=#%02x%02x%02x" $argv[1] $argv[2] $argv[3])
end
