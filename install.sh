#!/bin/bash

# install software
pacman -Syu --noconfirm
pacman -S --noconfirm networkmanager chrony grub sudo

# time
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc
systemctl enable 
systemctl enable systemd-timesyncd.service
systemctl enable cronie.service

# locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

# setup names localhosts etc
echo "a" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts

# root password
echo "root password setup"
passwd

# network
systemctl enable NetworkManager.service

# create user
useradd -m -G wheel,tty,audio,video,input,storage -s /bin/bash e
echo "user password setup"
passwd e

# add user to sudousers
echo "%wheel ALL=(ALL) ALL" | EDITOR="tee -a" visudo

# grub
# change "/dev/sdx" to your disk
# uncomment only one of next 2 lines, bios or uefi
grub-install /dev/sdx # bios
# ... # uefi
grub-mkconfig -o /boot/grub/grub.cfg

# reboot
reboot
