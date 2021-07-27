#!/bin/bash

# dir contains this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install nvidia
sudo pacman -S --noconfirm nvidia nvidia-settings

# add pacman hook to compile module on kernel upgrades
sudo mkdir -p /etc/pacman.d/hooks
sudo cp $DIR/../files/nvidia.hook /etc/pacman.d/hooks/


# blacklist nouveau driver
sudo mkdir -p /etc/modprobe.d/
sudo bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

# add graphics card configuration in Xorg server
sudo mkdir -p /etc/X11/xorg.conf.d
sudo cp $DIR/../files/20-nvidia.conf /etc/X11/xorg.conf.d/

echo "
Load nvidia modules on boot – update firmware

in: /etc/mkinitcpio.conf
set modules: MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)

then run: sudo mkinitcpio -P linux
"

