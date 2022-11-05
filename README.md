ubuntu
----
```
git clone -b main https://github.com/cumet04/dotfiles $HOME/dotfiles
$HOME/dotfiles/install.sh
```

Windows
----
#### Key repeat
Win+R -> `control keyboard`

#### winget
```
"Microsoft.PowerToys", "Microsoft.VisualStudioCode", "Google.Chrome", "Google.JapaneseIME", "SlackTechnologies.Slack", "9NW33J738BL0" | % { winget install $_ }
```

#### Setup WSL2
In Admin Powershell,
```
wsl --install
```
and reboot.

Then, in Powershell,
```
wsl --list --online
wsl --install -d Ubuntu
```

For Ubuntu-22.04, install it from the Store and then,
```
wsl --shutdown
wsl --unregister Ubuntu-22.04
ubuntu2204.exe --ui=tui
```
refs https://github.com/microsoft/WSL/issues/8525#issuecomment-1165632580

#### WindowsTerminal
commandline:
`wsl.exe -d Ubuntu /usr/bin/fish`

actions:
```
{ "command": { "action": "switchToTab", "index": 0 }, "keys": "alt+1" },
{ "command": { "action": "switchToTab", "index": 1 }, "keys": "alt+2" },
{ "command": { "action": "switchToTab", "index": 2 }, "keys": "alt+3" },
{ "command": { "action": "switchToTab", "index": 3 }, "keys": "alt+4" },
{ "command": { "action": "switchToTab", "index": 4 }, "keys": "alt+5" },
{ "command": { "action": "switchToTab", "index": 5 }, "keys": "alt+6" },
{ "command": { "action": "switchToTab", "index": 6 }, "keys": "alt+7" },
{ "command": { "action": "switchToTab", "index": 7 }, "keys": "alt+8" },
{ "command": { "action": "switchToTab", "index": 8 }, "keys": "alt+9" },
{ "command": { "action": "switchToTab", "index": 9 }, "keys": "alt+0" },
{ "command": { "action": "moveFocus", "direction": "nextInOrder" }, "keys": "alt+]" },
{ "command": { "action": "moveFocus", "direction": "previousInOrder" }, "keys": "alt+[" },
{ "command": { "action": "splitPane", "split": "horizontal" }, "keys": "alt+minus" },
{ "command": { "action": "splitPane", "split": "vertical" }, "keys": "alt+/" }
```
```
