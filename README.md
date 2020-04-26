ubuntu
----
```
export PERSONAL_BUCKET=xxxx
export BRANCH=master
export (AWS tokens)
curl -s https://raw.githubusercontent.com/cumet04/dotfiles/$BRANCH/install.sh | bash
```

windows
----
#### key repeat
in `HKEY_CURRENT_USER/Control Panel/Accessibility/Keyboard Response`
* AutoRepeatDelay 250
* AutoRepeatRate 20
* Flags 59 (magic number)
