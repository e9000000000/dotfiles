# xrandr --output eDP --brightness 0.5
setxkbmap -layout us,ru -option grp:win_space_toggle
xset r rate 190 25

nm-applet &
flameshot &
picom &
feh --bg-center ~/Dotfiles/bg.jpg &
dunst &

while true; do
	xsetroot -name "$([ "$(xset -q | awk '/LED/{print substr($10,5,1)}')" = "1" ] && (echo ru) || (echo en)) - $(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{ print $2 }') - $(date)"
	sleep 0.2
done &

dwm
