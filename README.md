ubuntu
----
```
git clone -b main https://github.com/cumet04/dotfiles $HOME/dotfiles
$HOME/dotfiles/install.sh
```

Windows
----
#### Enable WSL2
1. In Admin Powershell,
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
and reboot

2. Install kernel update package; https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
3. In Admin Powershell,
```
wsl --set-default-version 2
```

https://docs.microsoft.com/ja-jp/windows/wsl/install-win10

4. Install distribution
```
wsl --list --online
wsl --install -d Ubuntu
```

#### WindowsTerminal
commandline:
`wsl.exe -d Ubuntu-20.04 --cd ~  /usr/bin/fish`

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

#### Key repeat
in `HKEY_CURRENT_USER/Control Panel/Accessibility/Keyboard Response`
* AutoRepeatDelay 250
* AutoRepeatRate 20
* Flags 59 (magic number)

#### Disable web-search in start menu
1. Run `gpedit.msc` (グループポリシーの編集)
2. Dig tree view: コンピューターの構成 > 管理用テンプレート > Windowsコンポーネント > 検索
3. Activate: `Web を検索したり [検索] に Web の検索結果を表示したりしない`

refs https://www.tipsfound.com/windows10/06003
