#!/bin/bash
doas pacman -Sy
doas pacman -S --noconfirm --needed base-devel
cd
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
