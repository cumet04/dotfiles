ubuntu
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
curl -s https://raw.githubusercontent.com/cumet04/dotfiles/$BRANCH/install.sh | bash
```
