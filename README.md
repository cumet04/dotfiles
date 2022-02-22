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
Microsoft.PowerToys
Microsoft.VisualStudioCode
Google.Chrome
Google.JapaneseIME
SlackTechnologies.Slack
9NW33J738BL0 (Monitorian)
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

#### WindowsTerminal
commandline:
`wsl.exe -d Ubuntu --cd ~  /usr/bin/fish`

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

colors:
```
{
    "background": "#F5F5F5",
    "black": "#666666",
    "blue": "#0451A5",
    "brightBlack": "#000000",
    "brightBlue": "#0451A5",
    "brightCyan": "#0598BC",
    "brightGreen": "#14CE14",
    "brightPurple": "#BC05BC",
    "brightRed": "#CD3131",
    "brightWhite": "#A5A5A5",
    "brightYellow": "#B5BA00",
    "cursorColor": "#FFFFFF",
    "cyan": "#0598BC",
    "foreground": "#333333",
    "green": "#00BC00",
    "name": "Quiet Light",
    "purple": "#BC05BC",
    "red": "#CD3131",
    "selectionBackground": "#B8B8B8",
    "white": "#555555",
    "yellow": "#949800"
},
```
