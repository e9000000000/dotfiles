#!/bin/bash

# dir contains this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# remove all from user dir
rm -rf $DIR/user/

#create dirs
mkdir $DIR/user
mkdir $DIR/user/.config
mkdir $DIR/user/.config/Code\ -\ OSS
mkdir $DIR/user/.config/Code\ -\ OSS/User
mkdir $DIR/user/.scripts
mkdir $DIR/user/.bg

# copy configs
cp -r ~/.config/i3 $DIR/user/.config/
cp -r ~/.config/picom $DIR/user/.config/
cp -r ~/.config/polybar $DIR/user/.config/
cp ~/.xinitrc $DIR/user/
cp /etc/bash.bashrc $DIR/files/
cp -r ~/.Xresources $DIR/user/
#cp -r ~/.config/fish $DIR/user/.config/
cp -r ~/.config/htop $DIR/user/.config/
cp -r ~/.config/nvim $DIR/user/.config/
cp ~/.config/flake8 $DIR/user/.config/
cp ~/.config/Code\ -\ OSS/User/settings.json $DIR/user/.config/Code\ -\ OSS/User
cp ~/.config/Code\ -\ OSS/User/keybindings.json $DIR/user/.config/Code\ -\ OSS/User

# copy scripts
cp -r ~/.scripts $DIR/user/

# copy backgrounds
cp -r ~/.bg $DIR/user/
