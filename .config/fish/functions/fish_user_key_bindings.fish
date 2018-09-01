function fish_user_key_bindings
    ### ghq ###
    bind \cg '__ghq_crtl_g'
    if bind -M insert >/dev/null ^/dev/null
        bind -M insert \cg '__ghq_crtl_g'
    end
    ### ghq ###

    bind \cr 'commandline (history | peco --layout=bottom-up --on-cancel error | sed "s/^[^ ]* [^ ]* //");commandline -f repaint'
    bind \co walk
    bind \cs 'tig status;commandline -f repaint'
end
