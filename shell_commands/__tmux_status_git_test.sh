#!/bin/bash

set -eu
cd $(readlink -f $0 | xargs dirname)

echo "case 1"
diff <(./__tmux_status_git << EOS
## main...origin/main
EOS
) <(echo -n "On main, workspace is clear")

echo "case 2"
diff <(./__tmux_status_git << EOS
## main...origin/main
?? git-status
EOS
) <(echo -n "On main, no staged, no changed, #[fg=brightmagenta]1 untracked#[default]")

echo "case 3"
diff <(./__tmux_status_git << EOS
## main...origin/main
A  git-status
EOS
) <(echo -n "On main, #[fg=brightgreen]1 staged#[default], no changed, no untracked")

echo "case 4"
diff <(./__tmux_status_git << EOS
## main...origin/main
AM git-status
?? aaa
EOS
) <(echo -n "On main, #[fg=brightgreen]1 staged#[default], no changed, #[fg=brightmagenta]1 untracked#[default]")

echo "case 5"
diff <(./__tmux_status_git << EOS
## main...origin/main [ahead 1]
 M git-status
?? aaa
EOS
) <(echo -n "On main#[fg=yellow] +1#[default], no staged, #[fg=brightred]1 changed#[default], #[fg=brightmagenta]1 untracked#[default]")

echo "case 6"
diff <(./__tmux_status_git << EOS
## main...origin/main [ahead 1]
A  aaa
 M git-status
EOS
) <(echo -n "On main#[fg=yellow] +1#[default], #[fg=brightgreen]1 staged#[default], #[fg=brightred]1 changed#[default], no untracked")

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
) <(echo -n "On main#[fg=brightred] -1#[default], no staged, #[fg=brightred]5 changed#[default], #[fg=brightmagenta]2 untracked#[default]")

echo "case 8"
diff <(./__tmux_status_git << EOS
## tmux_status_git_perl
 M shell_commands/__tmux_status_git
?? shell_commands/git-status
EOS
) <(echo -n "On tmux_status_git_perl(local), no staged, #[fg=brightred]1 changed#[default], #[fg=brightmagenta]1 untracked#[default]")

echo "all ok"
