#!/bin/sh
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

while true; do
    xsetroot -name "$( date +"%F %R" )"
    sleep 1m    # Update time every minute
done &

urxvt -pe tabbed &

#Impersonate anopther Window Manager so NetBeans GUI is OK
wmname LG3D

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

./startdwm
