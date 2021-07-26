#!/bin/bash

# dir that script locate in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install nvidia
doas pacman -S --noconfirm nvidia nvidia-settings

# add pacman hook to compile module on kernel upgrades
doas mkdir -p /etc/pacman.d/hooks
doas cp $DIR/../files/nvidia.hook /etc/pacman.d/hooks/


# blacklist nouveau driver
doas mkdir -p /etc/modprobe.d/
doas bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

# add graphics card configuration in Xorg server
doas mkdir -p /etc/X11/xorg.conf.d
doas cp $DIR/../files/20-nvidia.conf /etc/X11/xorg.conf.d/

echo "
Load nvidia modules on boot – update firmware

in: /etc/mkinitcpio.conf
set modules: MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)

then run: doas mkinitcpio -P linux
"

