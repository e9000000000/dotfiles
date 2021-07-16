xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144
setxkbmap -option caps:escape
setxkbmap -layout us,ru
setxkbmap -option 'grp:alt_shift_toggle'
xset r rate 200 20
xrdb -load .Xresources

exec i3
