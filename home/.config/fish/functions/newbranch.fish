function newbranch
  set default_branch (git remote -v | head -n 1 | cut -f 2 | \
    sed 's|https://github.com/\([^. ]*\).*|\1|' | \
    xargs -I REPO gh api repos/REPO | \
    jq -r '.default_branch'
  )
  git fetch origin --prune --no-tags
  git branch $argv[1] origin/$default_branch
  git checkout $argv[1] 
end
