# direnv hook fish
function __direnv_export_eval --on-event fish_prompt;
	eval (direnv export fish);
end

# WSL2 hack; add windows ip to hosts. mainly for lemonade
if not grep windows.localdomain /etc/hosts > /dev/null
  echo 'Clean /tmp'
  find /tmp/ -mindepth 1 | xargs rm -rf ^/dev/null
  echo 'Clean $HOME'
  clean_home
  echo 'Add windows ip to hosts:'
  set winip (ip route show to default | cut -d' ' -f 3)
  echo "$winip windows.localdomain" | sudo tee -a /etc/hosts
end
