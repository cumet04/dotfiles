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

if which fcitx &> /dev/null; then fcitx; fi &
if which xscreensaver &> /dev/null; then xscreensaver -no-splash; fi &
syndaemon -t -k -i 1 -d
xset -b
xset r rate 200 40
xinput --set-prop "Logitech M570" "Device Accel Constant Deceleration" 2
xset m 3 4

exec awesome
