wsl
----
```
sudo visudo
> Defaults timestamp_timeout = 20

vim ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
sudo true
curl -s https://raw.githubusercontent.com/cumet04/dotfiles/master/install.sh | bash

sudo visudo
> (remove timeout)
```

windows
----
```
rm C:\Users\${USER}\AppData\Local\Packages\Microsoft.WindowsTerminal_*\RoamingState\profiles.json
mklink /H
C:\Users\${USER}\AppData\Local\Packages\Microsoft.WindowsTerminal_*\RoamingState\profiles.json
C:\Users\${USER}\Documents\dotfiles\configs\profiles.json
```
