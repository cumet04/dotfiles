function fish_prompt
    set prev_status $status

    set prompt_color green
    set prompt_color_err red

    set_color $prompt_color -u $prompt_color
    echo -n (pwd | sed "s|$HOME|\$HOME|" | xargs basename)
    set_color -u normal

    if test "$prev_status" = 0
        set_color $prompt_color
    else
        set_color $prompt_color_err
    end
    echo -n "> "
    set_color normal

    pwd > /tmp/.fish-last-dir
end
