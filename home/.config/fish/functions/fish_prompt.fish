function fish_prompt
    set prompt_color brgreen

    set_color $prompt_color -u $prompt_color
    echo -n (basename (__tmux_status_pwd))
    set_color -u normal
    set_color $prompt_color
    echo -n "> "
    set_color normal
end
