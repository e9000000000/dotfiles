# fixes
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
xset s off -dpms

# keyboard settings
# setxkbmap -layout us,ru -option grp:alt_shift_toggle
setxkbmap -layout us,ru -option
xmodmap ~/.Xmodmap
xset r rate 190 20

# screen
xrandr --output eDP --brightness 0.5

# bar data (for dwm)
# while [ 1 ]
# do
#     DATETIME=$(date "+%a %d-%m %H:%M")
#     POWER=$(upower -i `upower -e | grep BAT`| grep percentage | grep -P \\d+% -o)
#     KB=$(xset -q | grep LED | grep -P \\d{8} -o)
#     xsetroot -name "$KB  $POWER  $DATETIME"
#     sleep 1
# done &

# background
hsetroot -solid black &
# feh --bg-center ~/dotfiles/.bg/horizon.jpeg &

# run
picom &
dunst &
cd ~/code/language-indicator/ && .env/bin/python3 main.py &
cd ~
flameshot &
connman-gtk &
exec i3
