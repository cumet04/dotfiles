#/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset -b
xset r rate 250 30
xset m 4/3 4
# xscreensaver -no-splash &
syndaemon -t -k -i 1 -d

exec awesome
