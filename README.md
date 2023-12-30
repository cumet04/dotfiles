Windows
-----
#### Key repeat
Win+R -> `control keyboard`

#### winget
```
"Microsoft.PowerToys", "Microsoft.VisualStudioCode", "Google.Chrome", "Google.JapaneseIME", "SlackTechnologies.Slack", "9NW33J738BL0" | % { winget install $_ }
```

#### Setup WSL
```
wsl --list --online
wsl --install -d Ubuntu
```

#### WindowsTerminal
commandline:
`wsl.exe -d Ubuntu /bin/bash --login -c fish`; start fish with system-wide bash profile

actions:
```
{ "command": { "action": "moveFocus", "direction": "nextInOrder" }, "keys": "alt+]" },
{ "command": { "action": "moveFocus", "direction": "previousInOrder" }, "keys": "alt+[" },
{ "command": { "action": "splitPane", "split": "horizontal" }, "keys": "alt+minus" },
{ "command": { "action": "splitPane", "split": "vertical" }, "keys": "alt+/" }
```

#### vscode
setting sync

Ubuntu
-----

#### Init
```
git clone -b main https://github.com/cumet04/dotfiles $HOME/dotfiles
$HOME/dotfiles/install.sh
```

others
* `cp dotfiles/home/.gitconfig ./`
* `gh auth login`

aws config
* https://zenn.dev/cumet04/scraps/1a9861bc18bea7#comment-c67e8908869d49

```
gpg --gen-key
gpg --list-keys
pass init <key-id>
aws_vault add login_user
```

#### 移行時
* `repo_check_all`
* `backup_repo_files`
