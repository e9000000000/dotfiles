# fixes
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
xset s off -dpms

# keyboard settings
setxkbmap -layout us,ru
setxkbmap -option "grp:alt_shift_toggle"
xmodmap ~/.Xmodmap
xset r rate 190 20

# screen
xrandr --output eDP --brightness 0.6

# bar data
while [ 1 ]
do
    POWER=$(upower -i `upower -e | grep BAT`| grep percentage | grep -P \\d+% -o)
    KB=$(xset -q | grep LED | grep -P \\d{8} -o)
    xsetroot -name "$POWER - $KB - `date`"
    sleep 1
done &

# background
hsetroot -solid black &

# run
picom &
dunst &
flameshot &
exec dwm
