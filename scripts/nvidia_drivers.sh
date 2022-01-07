#!/bin/bash

# dir contains this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install nvidia
pacman -S --noconfirm nvidia nvidia-settings

# add pacman hook to compile module on kernel upgrades
mkdir -p /etc/pacman.d/hooks
echo "[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
Target=linux
# Change the linux part above and in the Exec line if a different kernel is used

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
" /etc/pacman.d/hooks/


# blacklist nouveau driver
mkdir -p /etc/modprobe.d/
bash -c "echo blacklist nouveau > /etc/modprobe.d/blacklist-nvidia-nouveau.conf"

# add graphics card configuration in Xorg server
mkdir -p /etc/X11/xorg.conf.d
echo 'Section "Device"
        Identifier "Nvidia Card"
        Driver "nvidia"
        VendorName "NVIDIA Corporation"
        BoardName "GeForce GTX 1080"
EndSection
' > /etc/X11/xorg.conf.d/

echo "
Load nvidia modules on boot – update firmware

in: /etc/mkinitcpio.conf
set modules: MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)

then run: sudo mkinitcpio -P linux
"