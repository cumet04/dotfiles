function fish_user_key_bindings
    bind \cr 'commandline (builtin history | peco --layout=bottom-up);commandline -f repaint'
    bind \cg ghq_look
    bind \co walk
    bind \cs 'tig status;commandline -f repaint'
end
