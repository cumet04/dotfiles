wsl
----
```
sudo visudo
> Defaults timestamp_timeout = 20
```

```
sudo apt-get update
sudo apt-get install ansible
curl -L https://github.com/cumet/dotfiles/archive/master.zip -o dotfiles.zip
unzip dotfiles.zip
cd dotfiles-master/playbook
ansible-playbook -i localhost, -c local --ask-become-pass entry.yaml

chsh
```

```
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
