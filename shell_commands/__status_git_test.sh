#!/bin/bash

set -eu
cd $(readlink -f $0 | xargs dirname)

echo "case 1"
diff <(./__tmux_status_git << EOS
## main...origin/main
EOS
) <(echo -en "On main, workspace is clear")

echo "case 2"
diff <(./__tmux_status_git << EOS
## main...origin/main
?? git-status
EOS
) <(echo -en "On main, no staged, no changed, \e[35m1 untracked\e[m")

echo "case 3"
diff <(./__tmux_status_git << EOS
## main...origin/main
A  git-status
EOS
) <(echo -en "On main, \e[32m1 staged\e[m, no changed, no untracked")

echo "case 4"
diff <(./__tmux_status_git << EOS
## main...origin/main
AM git-status
?? aaa
EOS
) <(echo -en "On main, \e[32m1 staged\e[m, no changed, \e[35m1 untracked\e[m")

echo "case 5"
diff <(./__tmux_status_git << EOS
## main...origin/main [ahead 1]
 M git-status
?? aaa
EOS
) <(echo -en "On main\e[33m +1\e[m, no staged, \e[31m1 changed\e[m, \e[35m1 untracked\e[m")

echo "case 6"
diff <(./__tmux_status_git << EOS
## main...origin/main [ahead 1]
A  aaa
 M git-status
EOS
) <(echo -en "On main\e[33m +1\e[m, \e[32m1 staged\e[m, \e[31m1 changed\e[m, no untracked")

echo "case 7"
diff <(./__tmux_status_git << EOS
## main...origin/main [behind 1]
 M home/.config/fish/config.fish
 M home/.config/nvim/init.vim
 M home/.config/tmux.conf
 M playbook/commands.yaml
 M playbook/library/ghcommand.py
?? aaa
?? git-status
EOS
) <(echo -en "On main\e[31m -1\e[m, no staged, \e[31m5 changed\e[m, \e[35m2 untracked\e[m")

echo "case 8"
diff <(./__tmux_status_git << EOS
## tmux_status_git_perl
 M shell_commands/__tmux_status_git
?? shell_commands/git-status
EOS
) <(echo -en "On tmux_status_git_perl(local), no staged, \e[31m1 changed\e[m, \e[35m1 untracked\e[m")

echo "case 9"
diff <(./__tmux_status_git << EOS
## main...origin/main [ahead 2, behind 1]
EOS
) <(echo -en "On main\e[31m -1\e[m\e[33m +2\e[m, workspace is clear")

echo "all ok"
