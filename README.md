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
