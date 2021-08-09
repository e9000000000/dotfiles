# video
xrandr --auto
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144

# keyboard
setxkbmap -option caps:escape
xset r rate 190 20

# ru-en keymap
setxkbmap -layout us,ru
setxkbmap -option 'grp:alt_shift_toggle'

# mouse
xinput set-prop "SteelSeries SteelSeries Rival 3" "libinput Accel Speed" -1

# wm
exec i3
