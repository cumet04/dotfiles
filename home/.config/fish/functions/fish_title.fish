function fish_title
  if git rev-parse --is-inside-work-tree >/dev/null ^/dev/null
    echo "["(git rev-parse --show-toplevel | xargs basename)"]"
  else
    pwd | sed "s|$HOME|\$HOME|" | xargs basename
  end
end
