```
sudo visudo
> Defaults timestamp_timeout = 20
```

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible
curl -OL https://github.com/medalhkr/dotfiles/archive/master.zip
unzip master.zip
cd dotfiles-master/playbook
ansible-playbook -i localhost, -c local --ask-become-pass entry.yaml
```

```
sudo visudo
> (remove timeout)
```
