```
sudo visudo
> Defaults timestamp_timeout = 15
```

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ansible
ansible-playbook -i localhost, -c local --ask-become-pass entry.yaml
```

```
sudo visudo
> (remove timeout)
```
