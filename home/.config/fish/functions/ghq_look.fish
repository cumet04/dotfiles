function ghq_look
    set selected (ghq list | peco --on-cancel error)
    if test $status -eq 0
        builtin cd (ghq root)/$selected
        commandline -f execute
    end
end
