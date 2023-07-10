dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
xset s off -dpms

# keyboard settings
setxkbmap -layout us,ru
setxkbmap -option "grp:alt_shift_toggle"
xmodmap ~/.Xmodmap
xset r rate 190 20

bspwm
# openbox
