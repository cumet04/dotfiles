function gh_create_repo
  set dir (gh_create_repo.sh $argv)
  test $status -eq 0; or return $status

  cd $dir
  cat LICENSE
end
