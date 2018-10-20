function ghq_look
    set selected (ghq list | peco --on-cancel error)
    test $status -eq 0; or return $status;

    for root in (ghq root --all)
        set target $root/$selected
        test -d $target; and builtin cd $target
    end
    commandline -f execute
end
