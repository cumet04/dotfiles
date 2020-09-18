ubuntu
----
In advance, put personal.tar.gz on $HOME
```
export BRANCH=master
curl -s https://raw.githubusercontent.com/cumet04/dotfiles/$BRANCH/install.sh | bash
```

#### docker
1. Do install above
2. In Docker Desktop, add integration for distro
3. `wsl -t XXX`
4. (Optional?) In Docker Desktop, remove/add integration for distro

windows
----
#### key repeat
in `HKEY_CURRENT_USER/Control Panel/Accessibility/Keyboard Response`
* AutoRepeatDelay 250
* AutoRepeatRate 20
* Flags 59 (magic number)

memo
----

#### clean $HOME
* `.npm`: can move/remove, but can't for part of them
  - This is created there by some package that has BAD install script (ex. esbuild)
* `.irb_history`: can remove, but can't move
  - Its location can be set by `.irbrc`, but `.irbrc` location can't be change
* `.vscode-server`: can't move/remove
* `.sudo_as_admin_successful`: can remove, but can't prevent creation
  - It is created every time by sudo
