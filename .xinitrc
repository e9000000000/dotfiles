# fixes
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
xset s off -dpms

# keyboard settings
# setxkbmap -layout us,ru -option grp:caps_toggle
setxkbmap -layout us,ru -option grp:alt_shift_toggle
xmodmap ~/.Xmodmap
xset r rate 190 20

# screen
xrandr --output eDP --brightness 0.5

# background
hsetroot -solid black &

# run
picom &
dunst &
cd ~/code/language-indicator/ && .env/bin/python3 main.py &
cd ~
flameshot &
connman-gtk &
exec i3
