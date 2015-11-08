# Load .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Disable PC beep
xset -b

# Decrease mouse sensitivity
xset m 1 1

# Start MPD with config
mpd ~/.config/mpd/mpd.conf

sh ~/.fehbg

exec i3 -V >> ~/i3log-$(date + '%F-%k-%M-%S') 2>&1
