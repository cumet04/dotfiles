function repo_look
  set root $HOME/repos
  set selected (
    find $root -maxdepth 3 -mindepth 3 -type d,l |
    sed "s|$root/||g" |
    sort |
    peco --on-cancel error
  )
  test $status -eq 0; or return $status;

  set target $root/$selected
  test -d $target; and builtin cd $target; and git s

  commandline -f execute
end
