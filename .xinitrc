# fixes
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
xset s off -dpms

# keyboard settings
setxkbmap -layout us,ru
setxkbmap -option "grp:alt_shift_toggle"
xmodmap ~/.Xmodmap
xset r rate 190 20

# bspwm
picom &
dunst &
flameshot &
hsetroot -solid black &
while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
    sleep 1
done &
exec dwm
