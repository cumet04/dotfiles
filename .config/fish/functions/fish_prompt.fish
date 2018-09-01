function fish_prompt
    set powerline_color brgreen
    set text_color black

    set_color -b $powerline_color
    set_color $text_color
    echo -n " "(basename (__tmux_status_pwd))" "
    set_color -b normal
    set_color $powerline_color
    printf '\uE0B0 '
    set_color normal
end
