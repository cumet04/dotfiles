function fish_user_key_bindings
    bind \cr history_search
    bind \cg ghq_look
    bind \co 'if [ -z $RANGER_LEVEL ]; ranger; else; exit; end'
    bind \cs 'tig status;commandline -f repaint'
end
