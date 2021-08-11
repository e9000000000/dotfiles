# video
xrandr --auto
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144

# devices
~/.scripts/configure_devices

# wm
exec bspwm
