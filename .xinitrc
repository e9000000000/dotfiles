# fixes
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
xset s off -dpms

# keyboard settings
setxkbmap -layout us,ru -option grp:alt_shift_toggle
xmodmap .Xmodmap
xset r rate 190 20

# screen
xrandr --output eDP --brightness 0.5

# background
hsetroot -solid black &

while true; do
	xset -q | awk '/LED/{print $10}' > /tmp/keyboard_lang
	sleep 1
done &

# run
picom &
connman-gtk &
feh --bg-center ~/dotfiles/wp.jpg
dbus-run-session i3
