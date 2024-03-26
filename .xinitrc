dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
xset s off -dpms
xrandr --output eDP --brightness 0.5
setxkbmap -layout us,ru -option grp:alt_shift_toggle
xmodmap .Xmodmap
xset r rate 190 20
hsetroot -solid black

picom &
connman-gtk &
while true; do
	xset -q | awk '/LED/{print $10}' > /tmp/keyboard_lang
	sleep 1
done &

dbus-run-session i3
