#!/bin/bash

# user configuration
BOOT="efi" # `bios` or `efi` lowercase
BOOTDISK="/dev/sdx" # disk with `/boot` dir
USERNAME="e"
HOSTNAME="a"

# dir contains this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# install software
pacman -Syu --noconfirm
pacman -S --noconfirm networkmanager grub sudo os-prober

# time
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc
systemctl enable
systemctl enable systemd-timesyncd.service

# locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

# setup names localhosts etc
echo $HOSTNAME > /etc/hostname
echo "127.0.0.1 localhost" > /etc/hosts
echo "::1 localhost" >> /etc/hosts

# root password
echo "root password:"
passwd

# network manager
systemctl enable NetworkManager.service

# dns configuration
# CONNECTION=$(nmcli con | grep "ethernet" | grep -Eo "^(\w|\w )+" | sed 's/\s*$//')
# nmcli con mod "$CONNECTION" ipv4.dns "8.8.8.8 8.8.4.4"

# create user
useradd -m -G wheel,tty,audio,video,input,storage,docker -s /bin/bash $USERNAME
echo "user password:"
passwd $USERNAME

# sudo configuring
echo "%wheel ALL=(ALL) ALL" | EDITOR="tee" visudo

# grub
if [ $BOOT == "bios" ]
then
    grub-install "$BOOTDISK"
elif [ $BOOT == "efi" ]
then
    mkdir /boot/EFI
    mount "$BOOTDISK"1 /boot/EFI
    pacman -S --noconfirm efibootmgr
    grub-install --target=x86_64-efi $BOOTDISK
else
    echo "please setup 'BOOT' variable to 'bios' or 'efi'"
fi

# grub config
grub-mkconfig -o /boot/grub/grub.cfg

# ask user to reboot
echo "please reboot now"
