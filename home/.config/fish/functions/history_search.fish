function history_search
    builtin history save; builtin history merge
    commandline (builtin history | peco --layout=bottom-up)
    commandline -f repaint
end
