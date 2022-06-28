# xrandr -s 1920x1080 -r 144
# nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
# xrandr --output DVI-D-0 --mode 1920x1080 --rate 144
xset s off -dpms
setxkbmap -option caps:escape
xset r rate 190 20
setxkbmap -layout us,ru
setxkbmap -option "grp:alt_shift_toggle"
xinput set-prop "SteelSeries SteelSeries Rival 3" "libinput Accel Speed" -1
xsetroot -cursor_name left_ptr
xrdb ~/.Xresources
exec bspwm
