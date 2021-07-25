#!/bin/bash

# install software
pacman -Syu --noconfirm
pacman -S --noconfirm networkmanager chrony grub sudo os-prober

# time
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc
systemctl enable 
systemctl enable systemd-timesyncd.service
systemctl enable cronie.service

# locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen
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
echo "permit :wheel as root" > /etc/doas.conf

# grub
# change "/dev/sdx" to your disk
# uncomment only one part below, bios or efi

# bios
# grub-install /dev/sdx

# efi
mkdir /boot/EFI
mount /dev/sdx1 /boot/EFI
pacman -S --noconfirm efibootmgr
grub-install --target=x86_64-efi /dev/sdx

# grub config
grub-mkconfig -o /boot/grub/grub.cfg

# reboot
echo "please reboot now"
