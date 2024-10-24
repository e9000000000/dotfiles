# xrandr --output eDP --brightness 0.5
setxkbmap -layout us,ru -option grp:win_space_toggle
xset r rate 190 25
hsetroot -solid "#000000" 

nm-applet &
flameshot &
picom &
dunst &

while true; do
	xsetroot -name "$([ "$(xset -q | awk '/LED/{print substr($10,5,1)}')" = "1" ] && (echo ru) || (echo en)) - $(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{ print $2 }') - $(date)"
	sleep 0.2
done &

export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
dwm
