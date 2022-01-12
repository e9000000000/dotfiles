#!/bin/bash


# 
# INSTALLATION
#

# variables
ls /sys/firmware/efi/efivars && BOOT=efi || BOOT=bios

fdisk -l | less
echo "disk to install arch (all data will be deleted) '/dev/sdx':"
read DISK

echo "username:"
read USERNAME

echo "hostname:"
read HOSTNAME


# partition the disks
if [ $BOOT == "bios" ]; then
    printf "g\nn\n\n\n+1M\nt\n4\nn\n\n\n\nw\n" | fdisk "$DISK"
else
    printf "g\nn\n\n\n+512M\nt\n1\nn\n\n\n\nw\n" | fdisk "$DISK"
    mkfs.fat -F 32 "$DISK"1
fi
mkfs.ext4 "$DISK"2

# mount
mount "$DISK"2 /mnt
if [ $BOOT == "efi" ]; then
    mkdir -p /mnt/boot
    mount "$DISK"1 /mnt/boot
fi

# install base
pacstrap /mnt base base-devel linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

# chroot
arch-chroot /mnt


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
echo "%wheel ALL=(ALL) ALL" | EDITOR="tee -a" visudo

# grub
if [ $BOOT == "bios" ]
then
    grub-install "$DISK"
elif [ $BOOT == "efi" ]
then
    mkdir /boot/EFI
    mount "$DISK"1 /boot/EFI
    pacman -S --noconfirm efibootmgr
    grub-install --target=x86_64-efi "$DISK"
else
    echo "please setup 'BOOT' variable to 'bios' or 'efi'"
fi

# grub config
grub-mkconfig -o /boot/grub/grub.cfg


# 
# CONFIGURATION
#

# dir contains this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

chown -R $USERNAME $DIR/user
su $USERNAME

# install paru
bash $DIR/scripts/paru_install.sh

# update software
paru -Syu

# install all another software with paru
for NAME in $(cat $DIR/lists/paru)
do
    paru -S --noconfirm $NAME
done

# copy config files
cp -r $DIR/user/. ~

# enable services
$DIR/scripts/services.sh

# configuring bash on system start
ln -s ~/.bashrc ~/.profile

# make code extensions marketplace work
sudo ~/.scripts/fix_code_extensions.py

# install python libs
for NAME in $(cat $DIR/lists/code)
do
    pip install $NAME
done

# install code extensions
for NAME in $(cat $DIR/lists/code)
do
    code --install-extension $NAME
done

# ask user to reboot
echo "please reboot now"
