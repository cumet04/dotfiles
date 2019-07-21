wsl
----
```
mkdir -m 700 ~/.ssh
touch ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
cat > ~/.ssh/id_rsa << EOF
...
...
EOF

export BRANCH=master
sudo true
curl -s https://raw.githubusercontent.com/cumet04/dotfiles/$BRANCH/install.sh | bash
```

windows
----
```
rm C:\Users\${USER}\AppData\Local\Packages\Microsoft.WindowsTerminal_*\RoamingState\profiles.json
mklink /H
C:\Users\${USER}\AppData\Local\Packages\Microsoft.WindowsTerminal_*\RoamingState\profiles.json
C:\Users\${USER}\Documents\dotfiles\configs\profiles.json
```
